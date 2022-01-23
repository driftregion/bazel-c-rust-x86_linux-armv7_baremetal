#include <stdint.h>
#include <stdlib.h>
#include "lm3s6965.h"

void _exit(int status)  {
    // https://stackoverflow.com/a/62100259
    register uint32_t r0 __asm__("r0");
    r0 = 0x18;
    register uint32_t r1 __asm__("r1");
    r1 = 0x20026;
    __asm__ volatile("bkpt #0xAB");
    exit(status);
}
