/* updateLcd.c
* 
* This file contains the implementation of the LCD update module. 
* The module is responsible for updating the LCD display with the current beat mode, volume, and BPM.
* The module also displays the audio and accelerometer timing statistics.
*
*/

#include "DEV_Config.h"
#include "LCD_1in54.h"
#include "GUI_Paint.h"
#include "GUI_BMP.h"
#include <stdio.h>		//printf()
#include <stdlib.h>		//exit()
#include <signal.h>     //signal()
#include <stdbool.h>
#include <assert.h>
#include "pthread.h"
#include "updateLcd.h"
#include "hal/joystick.h"
#include "sleep_timer_helper.h"
#include <time.h>
#include <stats.h>

#define DELAY_MS 2000
#define SLEEP_MS 10
#define BACKLIGHT 1023
#define INITIAL_X 5
#define INITIAL_Y 40
#define NEXTLINE_Y 40
#define FREQUENCY_X 140
#define DIPS_X 120
#define MAX_MS_X 160
#define VALUE_OFFSET 40
#define statBufferSize 12

static char hitStr[statBufferSize];
static char missStr[statBufferSize];
static char uptimeStr[statBufferSize];
static time_t startTime;

static UWORD *s_fb;
static bool isInitialized = false;
static pthread_t outputThread;
static bool isRunning = false;
static void* UpdateLcdThread(void* args);
void UpdateLcd_init()
{
    assert(!isInitialized);

    // Exception handling:ctrl + c
    // signal(SIGINT, Handler_1IN54_LCD);
    
    // Module Init
	if(DEV_ModuleInit() != 0){
        DEV_ModuleExit();
        exit(0);
    }
	
    // LCD Init
    DEV_Delay_ms(DELAY_MS);
	LCD_1IN54_Init(HORIZONTAL);
	LCD_1IN54_Clear(WHITE);
	LCD_SetBacklight(BACKLIGHT);

    UDOUBLE Imagesize = LCD_1IN54_HEIGHT*LCD_1IN54_WIDTH*2;
    if((s_fb = (UWORD *)malloc(Imagesize)) == NULL) {
        perror("Failed to apply for black memory");
        exit(0);
    }
    startTime = time(NULL);
    isRunning = true;
    isInitialized = true;
    pthread_create(&outputThread, NULL, &UpdateLcdThread, NULL);
}
void UpdateLcd_cleanup()
{
    assert(isInitialized);
    isRunning = false;
    pthread_join(outputThread, NULL);
    LCD_1IN54_Clear(WHITE);
    LCD_SetBacklight(0);
    // Module Exit
    free(s_fb);
    s_fb = NULL;
	DEV_ModuleExit();
    isInitialized = false;
}

static void* UpdateLcdThread(void* args) {
    (void) args;
    assert(isInitialized);
    while (isRunning) {
        UpdateLcd_withScore(getHits(), getMisses());
        sleepForMs(SLEEP_MS);
    }
    return NULL;
}


void UpdateLcd_withScore(int hit, int miss)
{
    assert(isInitialized);

    const int x = INITIAL_X;
    int y = INITIAL_Y;

    sprintf(hitStr, "%d", hit);
    sprintf(missStr, "%d", miss);

    printf("Hit: %s, Miss: %s\n", hitStr, missStr);

    // Calculate uptime
    time_t currentTime = time(NULL);
    int elapsedSeconds = (int)(currentTime - startTime);
    int minutes = elapsedSeconds / 60;
    int seconds = elapsedSeconds % 60;
    if (minutes < 0) minutes = 0;
    if (seconds < 0) seconds = 0;
    sprintf(uptimeStr, "%02d:%02d", minutes, seconds);

    // Initialize the RAM frame buffer to be blank (white)
    Paint_NewImage(s_fb, LCD_1IN54_WIDTH, LCD_1IN54_HEIGHT, 0, WHITE, 16);
    Paint_Clear(WHITE);

    Paint_DrawString_EN(x, y, "Hit(s): ", &Font16, WHITE, BLACK);
    Paint_DrawString_EN(x + VALUE_OFFSET, y, hitStr, &Font16, WHITE, BLACK);
    y += NEXTLINE_Y;
    Paint_DrawString_EN(x, y, "Miss(es): ", &Font16, WHITE, BLACK);
    Paint_DrawString_EN(x + VALUE_OFFSET, y, missStr, &Font16, WHITE, BLACK);
    y += NEXTLINE_Y;
    Paint_DrawString_EN(x, y, "Uptime: ", &Font16, WHITE, BLACK);
    Paint_DrawString_EN(x + VALUE_OFFSET, y, uptimeStr, &Font16, WHITE, BLACK);


    // Send the RAM frame buffer to the LCD (actually display it)
    LCD_1IN54_Display(s_fb);
}
