/* updateLcd.h
 * 
 * This module handles the LCD screen output, it start a thread and repeately display periodic statistics.
 * This includes the number of hits and misses, and the uptime of the system.
 * 
 */
#ifndef _UPDATELCD_H_
#define _UPDATELCD_H_

//Initialize and clean up the LCD screen.
void UpdateLcd_init();

//Clean up the LCD screen and free the resources.
void UpdateLcd_cleanup();

//update the LCD screen with the current score.
void UpdateLcd_withScore(int hit, int miss);

#endif