#include "stats.h"

static int hits = 0;
static int misses = 0;

int getHits(void) {
    return hits;
}

int getMisses(void) {
    return misses;
}

void incrementHits() {
    hits++;
}

void incrementMisses() {
    misses++;
}

