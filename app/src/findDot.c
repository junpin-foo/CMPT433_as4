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

GameState randomGameState(void) {
    GameState state;
    state.x = ((double)rand() / RAND_MAX) - 0.5;
    state.y = ((double)rand() / RAND_MAX) - 0.5;
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
    Lcd_init();
    isInitialized = true;
    pthread_create(&findDotThread, NULL, FindDot_thread, NULL);
}


void* FindDot_thread(void* arg)
{
    (void)arg; // Mark the parameter as unused
	volatile uint8_t *pR5Base = getR5MmapAddr();
    GameState currentGame = randomGameState();
    // GameState currentGame = {0.0, 0.0};
    // Tilt up: x -> -1.0
    // Tilt down: x -> 1.0
    // Lean right: y -> -1
    // Lean left : y -> 1
    while(true){
        AccelerometerData data =  Accelerometer_getReading();
        // printf("X: %.1f, Y: %.1f\n", data.x, data.y);
        float aimError = fabs(data.x - currentGame.x);
        if((data.x > currentGame.x) && (aimError > 0.1)) { //User has to point up (tilt up) Aiming way below the point
            int xLoc = (aimError >= 1.0) ? 0 : (4 - (int)(aimError * 4)); // Scale from 0 to 4 (0 is worse, 4 is best)
            
            printf("Point UP: Error: %d, xLoc: %d\n", (int)(aimError * 4), xLoc);
            MEM_UINT32(pR5Base + X_LOCATION_OFFSET) = xLoc;

        } else if ((data.x < currentGame.x) && (aimError > 0.1)){ //User has to point down (tilt down) . Aiming way above the point
            int xLoc = (aimError >= 1.0) ? 6 : (6 + (int)(aimError * 4)); // Scale from 6 (best) to 9 (worst)

            printf("Point DOWN: Error: %d, xLoc: %d\n", (int)(aimError * 4), xLoc);
            MEM_UINT32(pR5Base + X_LOCATION_OFFSET) = xLoc;

        } else { // up/down correct
            MEM_UINT32(pR5Base + X_LOCATION_OFFSET)  = 10;
        }

        float aimErrorY = fabs(data.y - currentGame.y);
        if ((data.y > currentGame.y) && (aimErrorY > 0.1)) { //User has to lean right. (Point on the right)
            MEM_UINT32(pR5Base + COLOR_OFFSET)  = 0;
            //
        } else if ((data.y < currentGame.y) && (aimErrorY > 0.1)) { //User has to lean left. (Point on the left)
            MEM_UINT32(pR5Base + COLOR_OFFSET)  = 1;
            //
        } else { // left/right correct
            MEM_UINT32(pR5Base + COLOR_OFFSET)  = 2;

        }

        if(BtnStateMachine_getValue() != 0){
            int flag = MEM_UINT32(pR5Base + FLAG_OFFSET) ; //0 = ready to change data, 1 = dont update data, animation happening
			printf("Rotary Button Pressed\n");
            BtnStateMachine_setValue(0);
            if(flag == 1){
                continue; //dont update data, animation happening
            }
            if(aimError <= 0.1 && aimErrorY <= 0.1){ //hit
                printf("Hit State\n");
                incrementHits();
                MEM_UINT32(pR5Base + FLAG_OFFSET) = 1; //dont change data
                MEM_UINT32(pR5Base + X_LOCATION_OFFSET)  = 11; //11 for hit
                currentGame = randomGameState(); //reset the game
            } else { //miss
                printf("Miss State\n");
                incrementMisses();
                MEM_UINT32(pR5Base + FLAG_OFFSET) = 1; //dont change data
                MEM_UINT32(pR5Base + X_LOCATION_OFFSET)  = 12; //12 for miss
            }
		}
        if(Joystick_isButtonPressed()){
            MEM_UINT32(pR5Base + X_LOCATION_OFFSET) = 13; // For remove all effect
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
    Accelerometer_cleanUp();
    BtnStateMachine_cleanup();
    Joystick_cleanUp();
    Gpio_cleanup();
    Ic2_cleanUp();
    isInitialized = false;
}
