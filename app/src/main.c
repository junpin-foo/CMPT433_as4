/* main.c
* 
*
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
#include <sys/mman.h>
#include <math.h>
#include <stats.h>
#include <updateLcd.h>
#include "sharedDataLayout.h"
#include "findDot.h"

int main(void)
{
    FindDot_init();

    FindDot_cleanUp();
    return 0;
}