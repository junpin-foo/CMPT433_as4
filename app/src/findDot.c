/* findDot.c
* This file contains the implementation of the FindDot game system.
* It initializes the hardware, spawns a game thread, and handles the game logic.
*/

#include "hal/i2c.h"
#include "hal/gpio.h"
#include "hal/joystick.h"
#include "hal/lcd.h"
#include "hal/rotary_btn_statemachine.h"
#include "hal/accelerometer.h"
#include "sleep_timer_helper.h"
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <assert.h>
#include <sys/mman.h>
#include <math.h>
#include <stats.h>
#include <updateLcd.h>
#include "sharedDataLayout.h"
#include <pthread.h>

// General R5 Memomry Sharing Routine
// ----------------------------------------------------------------
#define ATCM_ADDR     0x79000000  // MCU ATCM (p59 TRM)
#define BTCM_ADDR     0x79020000  // MCU BTCM (p59 TRM)
#define MEM_LENGTH    0x8000

typedef struct {
    double x;
    double y;
} GameState;

#define MAX_GAME_BOUND 0.5
#define MAX_AIM_ERROR 0.85
#define MIN_AIM_ERROR 0.1
#define GREEN_COLOR 0
#define RED_COLOR 1
#define BLUE_COLOR 2
#define UP_WORST_OFFSET 9
#define UP_BEST_OFFSET 5
#define DOWN_WORST_OFFSET 0
#define DOWN_BEST_OFFSET 4
#define UPDOWN_RANGE 4
#define ALL_LEDS_ON 10
#define HIT_EFFECT 11
#define MISS_EFFECT 12
#define REMOVE_EFFECT 13

GameState randomGameState(void) {
    GameState state;
    state.x = ((double)rand() / RAND_MAX) - MAX_GAME_BOUND;
    state.y = ((double)rand() / RAND_MAX) - MAX_GAME_BOUND;
    return state;
}

static bool isInitialized = false;
static pthread_t findDotThread;
static void* FindDot_thread(void* arg);

// Return the address of the base address of the ATCM memory region for the R5-MCU
static volatile void* getR5MmapAddr(void)
{
    // Access /dev/mem to gain access to physical memory (for memory-mapped devices/specialmemory)
    int fd = open("/dev/mem", O_RDWR | O_SYNC);
    if (fd == -1) {
        perror("ERROR: could not open /dev/mem; Did you run with sudo?");
        exit(EXIT_FAILURE);
    }

    // Inside main memory (fd), access the part at offset BTCM_ADDR:
    // (Get points to start of R5 memory after it's memory mapped)
    volatile void* pR5Base = mmap(0, MEM_LENGTH, PROT_READ | PROT_WRITE, MAP_SHARED, fd, BTCM_ADDR);
    if (pR5Base == MAP_FAILED) {
        perror("ERROR: could not map memory");
        exit(EXIT_FAILURE);
    }
    close(fd);

    return pR5Base;
}

static void freeR5MmapAddr(volatile uint8_t* pR5Base)
{
    if (munmap((void*) pR5Base, MEM_LENGTH)) {
        perror("R5 munmap failed");
        exit(EXIT_FAILURE);
    }
}

void FindDot_init(void)
{
    assert(!isInitialized);
	Ic2_initialize();
	Gpio_initialize();
	Joystick_initialize();
    BtnStateMachine_init();
    Accelerometer_initialize();
    STATS_init();
    Lcd_init();
    isInitialized = true;
    pthread_create(&findDotThread, NULL, FindDot_thread, NULL);
}


void* FindDot_thread(void* arg)
{
    (void)arg; // Mark the parameter as unused
	volatile uint8_t *pR5Base = getR5MmapAddr();
    GameState currentGame = randomGameState();
    while(true){
        AccelerometerData data =  Accelerometer_getReading();
        // printf("X: %.1f, Y: %.1f\n", data.x, data.y);
        float aimError = fabs(data.x - currentGame.x);
        float maxError = (data.x > currentGame.x) ? (1.0 - currentGame.x) : (currentGame.x - (-1.0));
        float normalizedError = aimError / maxError;

        if((data.x > currentGame.x) && (aimError > MIN_AIM_ERROR)) { //User has to point up (tilt up) Aiming way below the point
            int xLoc = (normalizedError >= MAX_AIM_ERROR) ? DOWN_WORST_OFFSET : (DOWN_BEST_OFFSET - (int)(normalizedError * UPDOWN_RANGE)); // Scale from 0 to 4 (0 is worse, 4 is best)
            
            // printf("Point UP: rand x: %.2f, curr x: %.2f, xLoc: %d, aimError: %.2f, normalizedError: %.2f\n", currentGame.x, data.x, xLoc, aimError, normalizedError);
            MEM_UINT32(pR5Base + X_LOCATION_OFFSET) = xLoc;

        } else if ((data.x < currentGame.x) && (aimError > MIN_AIM_ERROR)){ //User has to point down (tilt down) . Aiming way above the point
            int xLoc = (normalizedError >= MAX_AIM_ERROR) ? UP_WORST_OFFSET : (UP_BEST_OFFSET + (int)(normalizedError * UPDOWN_RANGE)); // Scale from 5 (best) to 9 (worst)

            // printf("Point DOWN: rand x: %.2f, curr x: %.2f, xLoc: %d, aimError: %.2f, normalizedError: %.2f\n", currentGame.x, data.x,  xLoc, aimError, normalizedError);
            MEM_UINT32(pR5Base + X_LOCATION_OFFSET) = xLoc;

        } else { // up/down correct
            MEM_UINT32(pR5Base + X_LOCATION_OFFSET)  = ALL_LEDS_ON;
        }

        float aimErrorY = fabs(data.y - currentGame.y);
        if ((data.y > currentGame.y) && (aimErrorY > MIN_AIM_ERROR)) { //User has to lean right. (Point on the right)
            MEM_UINT32(pR5Base + COLOR_OFFSET)  = GREEN_COLOR;
        } else if ((data.y < currentGame.y) && (aimErrorY > MIN_AIM_ERROR)) { //User has to lean left. (Point on the left)
            MEM_UINT32(pR5Base + COLOR_OFFSET)  = RED_COLOR;
        } else { // left/right correct
            MEM_UINT32(pR5Base + COLOR_OFFSET)  = BLUE_COLOR;

        }

        if(BtnStateMachine_getValue() != 0){
            int flag = MEM_UINT32(pR5Base + FLAG_OFFSET) ; //0 = ready to change data, 1 = dont update data, animation happening
            // printf("flag: %d\n", flag);
			// printf("Rotary Button Pressed\n");
            BtnStateMachine_setValue(0);
            if(flag == 1){
                continue; //dont update data, animation happening
            }
            if(aimError <= MIN_AIM_ERROR && aimErrorY <= MIN_AIM_ERROR){ //hit
                // printf("Hit State\n");
                STATS_incrementHits();
                MEM_UINT32(pR5Base + FLAG_OFFSET) = 1; //dont change data
                MEM_UINT32(pR5Base + X_LOCATION_OFFSET)  = HIT_EFFECT; //11 for hit
                currentGame = randomGameState(); //reset the game
            } else { //miss
                // printf("Miss State\n");
                STATS_incrementMisses();
                MEM_UINT32(pR5Base + FLAG_OFFSET) = 1; //dont change data
                MEM_UINT32(pR5Base + X_LOCATION_OFFSET)  = MISS_EFFECT; //12 for miss
            }
		}
        if(Joystick_isButtonPressed()){
            MEM_UINT32(pR5Base + X_LOCATION_OFFSET) = REMOVE_EFFECT; // For remove all effect
            freeR5MmapAddr(pR5Base);
            break;
		}
        sleepForMs(200);
    }
    return NULL;
}

void FindDot_cleanUp(void)
{
    assert(isInitialized);
    pthread_join(findDotThread, NULL);
    Lcd_cleanup();
    STATS_cleanUp();
    Accelerometer_cleanUp();
    BtnStateMachine_cleanup();
    Joystick_cleanUp();
    Gpio_cleanup();
    Ic2_cleanUp();
    isInitialized = false;
}
