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

int main(void)
{
	Ic2_initialize();
	Gpio_initialize();
	Joystick_initialize();

	volatile uint8_t *pR5Base = getR5MmapAddr();

	while(true){
		if(Joystick_isButtonPressed()){
			MEM_UINT32(pR5Base + IS_BUTTON_PRESSED_OFFSET)  = 1;
			printf("Button Pressed\n");
		}
		else {
			MEM_UINT32(pR5Base + IS_BUTTON_PRESSED_OFFSET)  = 0;
		}
		sleepForMs(100);
	}
}