#include <stdint.h>
#include <stdio.h>
#include "lib/lib.h"

#ifndef HOST
#define HOST "undefined"
#endif

int main() {
    printf("Hello from C compiled for %s!\n", HOST);
    const int i = 4;
    printf("%s calculated squared(%d) = %d\n", whoami(), i, squared(i));
}