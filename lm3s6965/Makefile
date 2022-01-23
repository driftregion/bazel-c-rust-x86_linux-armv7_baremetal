
SRCS=main.c \
startup_lm3s6965.S \
src/system_lm3s.c \
src/system_exit.c \
src/embedded-hal/console.c \
src/embedded-hal/delay.c 

CFLAGS=-g \
-fno-exceptions \
--specs=nosys.specs \
-mthumb \
-march=armv7 \
-mfix-cortex-m3-ldrd \
-Wl,--trace-symbol=_write

out.elf: $(SRCS)
	arm-none-eabi-gcc  -T lm3s6965.ld -Iinc $(SRCS) -o $@ $(CFLAGS) 
	arm-none-eabi-objcopy -O binary out.elf out.bin

all: out.elf

clean:
	rm out.elf
