/* stats.h
*   This file contains the declarations for the statistics tracking module.
*   It tracks the number of hits and misses in the FindDot game system.
*   The module provides functions to initialize, clean up, and access the statistics.
*/

#ifndef STATS_H
#define STATS_H

void STATS_init(void);
void STATS_cleanUp(void);

int STATS_getHits(void);
int STATS_getMisses(void);

void STATS_incrementHits(void);   
void STATS_incrementMisses(void); 

#endif // STATS_H
