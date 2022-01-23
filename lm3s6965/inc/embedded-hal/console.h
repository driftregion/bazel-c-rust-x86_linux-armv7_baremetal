#ifndef CONSOLE_H
#define CONSOLE_H

#include <stddef.h>

int console_read(char *buffer, size_t size);
int console_write(const char *buffer, size_t size);
int console_write_string(const char *buffer);

#endif
