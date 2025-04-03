/* stats.c
* This file contain the implementation of the statistics module to track the player hits and misses in find dot game.
* It provides functions to initialize, clean up, and retrieve the number of hits and misses.
*/
#include "stats.h"

static int hits = 0;
static int misses = 0;

void STATS_init(void) {
    hits = 0;
    misses = 0;
}

void STATS_cleanUp(void) {
    hits = 0;
    misses = 0;
}

int STATS_getHits(void) {
    return hits;
}

int STATS_getMisses(void) {
    return misses;
}

void STATS_incrementHits() {
    hits++;
}

void STATS_incrementMisses() {
    misses++;
}

