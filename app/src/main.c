/* main.c
* 
*
*/
#include "hal/i2c.h"
#include "hal/gpio.h"
#include "hal/joystick.h"
#include "hal/lcd.h"
#include "hal/accelerometer.h"
#include "sleep_timer_helper.h"
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <sys/mman.h>

#include "sharedDataLayout.h"


// General R5 Memomry Sharing Routine
// ----------------------------------------------------------------
#define ATCM_ADDR     0x79000000  // MCU ATCM (p59 TRM)
#define BTCM_ADDR     0x79020000  // MCU BTCM (p59 TRM)
#define MEM_LENGTH    0x8000

// Return the address of the base address of the ATCM memory region for the R5-MCU
volatile void* getR5MmapAddr(void)
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
int main(void)
{
	Ic2_initialize();
	Gpio_initialize();
	Joystick_initialize();

	volatile uint8_t *pR5Base = getR5MmapAddr();
    int count = 0;
	while(true){
		if(Joystick_isButtonPressed()){
            count = count % 9 + 1;
			printf("Button Pressed\n");
		}
		MEM_UINT32(pR5Base + X_LOCATION_OFFSET)  = count;
		sleepForMs(100);
	}

    // Accelerometer_initialize();
    // GameState currentGame = randomGameState();
    // // Tilt up: x -> -1.0
    // // Tilt down: x -> 1.0
    // // Lean right: y -> -1
    // // Lean left : y -> 1
    // while(true){
    //     AccelerometerData data =  Accelerometer_getReading();
    //     printf("X: %.1f, Y: %.1f\n", data.x, data.y);
    //     if(data.x > currentGame.x) { //User has to point up (point 0.5, current 0.7 -> tilt up )
    //         //
    //     } else if (data.x < currentGame.x){ //User has to point down 
    //         //
    //     } else { // up/down correct
            
    //     }

    //     if (data.y > currentGame.y) { //User has to lean right
    //         //
    //     } else if (data.y < currentGame.y) { //User has to lean left
    //         //
    //     } else { // left/right correct

    //     }


    //     sleepForMs(200);
    // }
}