#include <embedded-hal/console.h>

#include <stdbool.h>
#include <string.h>

#include <lm3s6965.h>

#define UART_FR_BUSY 0x08
#define UART_FR_RXFE 0x10
#define UART_FR_TXFF 0x20
#define UART_FR_RXFF 0x40
#define UART_FR_TXFE 0x80

static char uart_get_char(UART0_Type *self);
static char uart_put_char(UART0_Type *self, char c);
static bool uart_wait_rx(const UART0_Type *self);
static bool uart_wait_tx(const UART0_Type *self);

int _read(int fd, void *buffer, size_t size);
int _write(int fd, const void *buffer, size_t size);

int console_read(char *buffer, size_t size) {
  return _read(0, (void *)buffer, size);
}

int console_write(const char *buffer, size_t size) {
  return _write(0, (void *)buffer, size);
}

int console_write_string(const char *buffer) {
  return console_write(buffer, strlen(buffer));
}

int _read(int fd, void *buffer, size_t size) {
  for (size_t i = 0; i < size; i++) {
    uint8_t *p = &(((uint8_t *)buffer)[i]);
    *p = uart_get_char(UART0);
    p++;
  }
  return size;
}

int _write(int fd, const void *buffer, size_t size) {
  for (size_t i = 0; i < size; i++) {
    uint8_t *p = &(((uint8_t *)buffer)[i]);
    uart_put_char(UART0, *p);
    p++;
  }
  return size;
}

static char uart_get_char(UART0_Type *self) {
  uart_wait_rx(self);
  return self->DR;
}

static char uart_put_char(UART0_Type *self, char c) {
  uart_wait_tx(self);
  self->DR = c;
  uart_wait_tx(self);
}

static bool uart_wait_rx(const UART0_Type *self) {
  while (self->FR & UART_FR_RXFE == UART_FR_RXFE) {
  }
}

static bool uart_wait_tx(const UART0_Type *self) {
  while (self->FR & UART_FR_TXFE != UART_FR_TXFE) {
  }
}
