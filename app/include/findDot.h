#ifndef FIND_DOT_H
#define FIND_DOT_H

#include <stdbool.h>

// Initializes the FindDot game system
// Sets up hardware and spawns game thread
void FindDot_init(void);

// Cleans up all initialized hardware and joins the game thread
void FindDot_cleanUp(void);

#endif // FIND_DOT_H
