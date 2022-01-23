#include <embedded-hal/delay.h>

void software_delay_ms(uint64_t value) {
  for (uint64_t i = 0; i < value; i++) {
    __asm("nop");
  }
}
