/* findDot.h
*   This file contains the declarations to initialize the module for the FindDot game system.
*   The module should start a thread to:
*   1. Generate random game states for the player's target position.
*   2. Track and analyze accelerometer data to guide the player in aiming.
*   3. Handle game state updates and user interactions. via setting the LED the NeoPixel via memry sharing code with R5
*/


#ifndef FIND_DOT_H
#define FIND_DOT_H

#include <stdbool.h>

// Initializes the FindDot game system
// Sets up hardware and spawns game thread
void FindDot_init(void);

// Cleans up all initialized hardware and joins the game thread
void FindDot_cleanUp(void);

#endif // FIND_DOT_H
