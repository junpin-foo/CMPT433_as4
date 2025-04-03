/* sharedDataLayout.h
* This file defines the layout of shared data between the R5 and A53 cores. Consist of 
* 1. Message buffer
* 2. X location - which LED to light up. (0-9)
* 3. Color - what color to display on the LCD.
* 4. Flag - tell us when the animation current running is done.
*/

#ifndef _SHARED_DATA_STRUCT_H_
#define _SHARED_DATA_STRUCT_H_

#include <stdbool.h>
#include <stdint.h>

#define MSG_OFFSET 0
#define MSG_SIZE   32
#define X_LOCATION_OFFSET (MSG_OFFSET + sizeof(uint32_t))
#define COLOR_OFFSET (X_LOCATION_OFFSET + sizeof(uint32_t))
#define FLAG_OFFSET (COLOR_OFFSET + sizeof(uint32_t))

#define MEM_UINT8(addr) *(uint8_t*)(addr)
#define MEM_UINT32(addr) *(uint32_t*)(addr)
#endif
