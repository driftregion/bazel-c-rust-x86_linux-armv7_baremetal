#include "lib/lib.h"

uint32_t squared(uint32_t n) {
    return n * n;
}

const char *whoami() {
    return (const char*)&"C library";
}