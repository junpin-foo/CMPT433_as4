// NeoPixel Driver Sample
//
// Based off the Zephyr blinky sample application.
// - Designed to be compiled for BeagleY-AI's MCU R5
//   (because the custom hardware uses pins that are mapped to the MCU domain)

#include <stdio.h>
#include <stdlib.h>
#include <zephyr/kernel.h>
#include <zephyr/drivers/gpio.h>
#include <string.h>
#include "sharedDataLayout.h"

// Memory
// ----------------------------------------
#define SHARED_MEM_BTCM_START 0x00000000  // TRM p848
#define SHARED_MEM_ATCM_START 0x00041010  // TRM p849
static volatile uint8_t *pR5Base = NULL;


#define NEO_NUM_LEDS          8   // # LEDs in our string

// NeoPixel Timing
// NEO_<one/zero>_<on/off>_NS
// (These times are what the hardware needs; the delays below are hand-tuned to give these).
#define NEO_ONE_ON_NS       700   // Stay on 700ns
#define NEO_ONE_OFF_NS      600   // (was 800)
#define NEO_ZERO_ON_NS      350
#define NEO_ZERO_OFF_NS     800   // (Was 600)
#define NEO_RESET_NS      60000   // Must be at least 50us, use 60us

// Delay time includes 1 GPIO set action.
volatile int junk_delay = 0;
#define DELAY_350_NS() {}
#define DELAY_600_NS() {for (junk_delay=0; junk_delay<9 ;junk_delay++);}
#define DELAY_700_NS() {for (junk_delay=0; junk_delay<16 ;junk_delay++);}
#define DELAY_800_NS() {for (junk_delay=0; junk_delay<23 ;junk_delay++);}

#define DELAY_NS(ns) do {int target = k_cycle_get_32() + k_ns_to_cyc_near32(ns); \
	while(k_cycle_get_32() < target) ; } while(false)

#define NEO_DELAY_ONE_ON()     DELAY_700_NS()
#define NEO_DELAY_ONE_OFF()    DELAY_600_NS()
#define NEO_DELAY_ZERO_ON()    DELAY_350_NS()
#define NEO_DELAY_ZERO_OFF()   DELAY_800_NS()
#define NEO_DELAY_RESET()      {DELAY_NS(NEO_RESET_NS);}

// Device tree nodes for pin aliases
#define LED0_NODE DT_ALIAS(led0)
#define BTN0_NODE DT_ALIAS(btn0)
#define NEOPIXEL_NODE DT_ALIAS(neopixel)

static const struct gpio_dt_spec led = GPIO_DT_SPEC_GET(LED0_NODE, gpios);
static const struct gpio_dt_spec btn = GPIO_DT_SPEC_GET(BTN0_NODE, gpios);
static const struct gpio_dt_spec neopixel = GPIO_DT_SPEC_GET(NEOPIXEL_NODE, gpios);

static void initialize_gpio(const struct gpio_dt_spec *pPin, int direction) 
{
	if (!gpio_is_ready_dt(pPin)) {
		printf("ERROR: GPIO pin not ready read; direction %d\n", direction);
		exit(EXIT_FAILURE);
	}

	int ret = gpio_pin_configure_dt(pPin, direction);
	if (ret < 0) {
		printf("ERROR: GPIO Pin Configure issue; direction %d\n", direction);
		exit(EXIT_FAILURE);
	}
}

static void setColor(uint32_t color) 
{
	for(int i = 31; i >= 0; i--) {
		if((color & ((uint32_t)0x1 << i ))) {
			gpio_pin_set_dt(&neopixel, 1);
			NEO_DELAY_ONE_ON();
			gpio_pin_set_dt(&neopixel, 0);
			NEO_DELAY_ONE_OFF();
		} else {
			gpio_pin_set_dt(&neopixel, 1);
			NEO_DELAY_ZERO_ON();
			gpio_pin_set_dt(&neopixel, 0);
			NEO_DELAY_ZERO_OFF();
		}
	}
}

int main(void)
{
	printf("Hello World! %s\n", CONFIG_BOARD_TARGET);

	initialize_gpio(&led, GPIO_OUTPUT_ACTIVE);
	initialize_gpio(&btn, GPIO_INPUT);
	initialize_gpio(&neopixel, GPIO_OUTPUT_ACTIVE);

	// COLOURS
    // - 1st element in array is 1st (bottom) on LED strip; last element is last on strip (top)
    // - Bits: {Green/8 bits} {Red/8 bits} {Blue/8 bits} {White/8 bits}
    // uint32_t color[NEO_NUM_LEDS] = {
    //     0x0f000000, // Green
    //     0x000f0000, // Red
    //     0x00000f00, // Blue
    //     0x0000000f, // White
    //     0x0f0f0f00, // White (via RGB)
    //     0x0f0f0000, // Yellow
    //     0x000f0f00, // Purple
    //     0x0f000f00, // Teal

    //     // Try these; they are birght! 
    //     // (You'll need to comment out some of the above)
    //     // 0xff000000, // Green Bright
    //     // 0x00ff0000, // Red Bright
    //     // 0x0000ff00, // Blue Bright
    //     // 0xffffff00, // White
    //     // 0xff0000ff, // Green Bright w/ Bright White
    //     // 0x00ff00ff, // Red Bright w/ Bright White
    //     // 0x0000ffff, // Blue Bright w/ Bright White
    //     // 0xffffffff, // White w/ Bright White
    // }; 



	pR5Base = (volatile void *) SHARED_MEM_BTCM_START;
	uint32_t currentBrightColor = 0xff000000;
    uint32_t currentColor =0x0f000000;
	while (true) {
		gpio_pin_set_dt(&neopixel, 0);
		DELAY_NS(NEO_RESET_NS);
	
		//X_LOCATION_OFFSET: 0 - 9 (top - bottom); 10 is all ON; 11 for hit, 12 for miss
		int xLoc = MEM_UINT32(pR5Base + X_LOCATION_OFFSET) - 1 ; // (Minus 1 here to match the LED array index)
		//COLOR_OFFSET: 0 - 2 (0:Green, 1:Red, 2:Blue)
		int colorCode = MEM_UINT32(pR5Base + COLOR_OFFSET);

		// Changing Color
		if (colorCode == 0) {
			currentBrightColor = 0xff000000;
			currentColor =0x0f000000;
		} else if (colorCode == 1) {
			currentBrightColor = 0x00ff0000;
			currentColor =0x000f0000;
		} else {
			currentBrightColor = 0x0000ff00;
			currentColor =0x00000f00;
		}

	
		if(xLoc == 9){ //ALL ON
			for(int j = (NEO_NUM_LEDS - 1); j >= 0; j--) {
				setColor(currentBrightColor);
			}
			continue;
		} else if (xLoc == 10) { //HIT
			uint32_t explosion_colors[] = {0x00ff0000, 0xffff0000, 0xffffffff}; // red, yellow, white
			int delay_time = 25; 
			setColor(explosion_colors[0]);
			k_busy_wait(delay_time * 10000); // Wait before expanding further
			for (int k = 0; k <= NEO_NUM_LEDS / 2; k++) {
				for (int j = (NEO_NUM_LEDS - 1); j >= 0; j--) {
					if(j == (NEO_NUM_LEDS / 2 - k) || j == (NEO_NUM_LEDS / 2 + k)){
						setColor(explosion_colors[0]);
					} else if (j == (NEO_NUM_LEDS / 2 - k) -1|| j == (NEO_NUM_LEDS / 2 + k) +1){
						setColor(explosion_colors[1]);
					}
					else if (j == (NEO_NUM_LEDS / 2 - k) -2|| j == (NEO_NUM_LEDS / 2 + k) +2){
						setColor(explosion_colors[2]);
					} else {
						setColor(0x00000000);
					}
				}
				k_busy_wait(delay_time * 10000); // Wait before expanding further
			}
			continue;
		}
		else if (xLoc == 11) { //MISS
			int delay_time = 25;
			for(int k = 0;  k < NEO_NUM_LEDS; k++) {
				for(int j = (NEO_NUM_LEDS - 1); j >= 0; j--) {
					if (j == k) { //on
						setColor(0x000f0f00); //purple
					}
					else { //off
						setColor(0x00000000);
					}
				}
				k_busy_wait(delay_time * 10000);; // Wait before changing colors
			}
			continue;
		}

		for(int j = (NEO_NUM_LEDS - 1); j >= 0; j--) {
			if (j == (xLoc-1) || (j == (xLoc +1))) {
				setColor(currentColor);
			} else if (j == xLoc) {
				setColor(currentBrightColor);
			} else {
				setColor(0x00000000);
			}
		}
		gpio_pin_set_dt(&neopixel, 0);
		NEO_DELAY_RESET();

		MEM_UINT32(pR5Base + FLAG_OFFSET) = 0; //can change data flag

		// Keep looping in case we plug in NeoPixel later
		k_busy_wait(1 * 10000);
	}
	return 0;
}
