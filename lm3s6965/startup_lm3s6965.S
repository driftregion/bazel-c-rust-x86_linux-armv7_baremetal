/// \file startup_lm3s6965.s
///     A GNU linker script configured to use the rdmimon libc.
///
///     This allow out of the box semihosting

    .syntax unified
    .arch armv7-m

// Creation of the .stack section
    .equ stack_size, 0x00000400
    .section ".stack", "w"
    .align   3
        .globl   __stack_top
        .globl   __stack_limit
__stack_limit:
    .space   stack_size
    .size    __stack_limit, . - __stack_limit
__stack_top:
    .size __stack_top, . - __stack_top

// Creation of the .heap section
    .equ heap_size, 0x00000C00
    .if      heap_size != 0 
    .section ".heap", "w"
    .align  3
        .globl   __heap_start
        .globl   __heap_end
__heap_start:
    .space   heap_size
    .size    __heap_start, . - __heap_start
__heap_end:
    .size    __heap_end, . - __heap_end
    .endif

// Creation of the .vectors section
    .section ".vectors", "a"
    .align 2
    .globl  __vectors
    .globl  __vectors_end
    .globl  __vectors_size
    .type   __vectors, %object
__vectors:
// Exceptions
    .long   __stack_top                 // Top of Stack
    .long   Reset_Handler               // Reset Handler
    .long   NMI_Handler                 // NMI Handler
    .long   HardFault_Handler           // Hard Fault Handler
    .long   MemManage_Handler           // MPU Fault Handler
    .long   BusFault_Handler            // Bus Fault Handler
    .long   UsageFault_Handler          // Usage Fault Handler
    .long   0                           // Reserved
    .long   0                           // Reserved
    .long   0                           // Reserved
    .long   0                           // Reserved
    .long   SVC_Handler                 // SVCall Handler
    .long   DebugMon_Handler            // Debug Monitor Handler
    .long   0                           // Reserved
    .long   PendSV_Handler              // PendSV Handler
    .long   SysTick_Handler             // SysTick Handler
// Interruptions
    .long   GPIOA_IRQHandler            // GPIOA_IRQHandler
    .long   GPIOB_IRQHandler            // GPIOB_IRQHandler
    .long   GPIOC_IRQHandler            // GPIOC_IRQHandler
    .long   GPIOD_IRQHandler            // GPIOD_IRQHandler
    .long   GPIOE_IRQHandler            // GPIOE_IRQHandler
    .long   UART0_IRQHandler            // UART0_IRQHandler
    .long   UART1_IRQHandler            // UART1_IRQHandler
    .long   SSI0_IRQHandler             // SSI0_IRQHandler
    .long   I2C0_IRQHandler             // I2C0_IRQHandler
    .long   PWM0_FAULT_IRQHandler       // PWM0_FAULT_IRQHandler
    .long   PWM0_0_IRQHandler           // PWM0_0_IRQHandler
    .long   PWM0_1_IRQHandler           // PWM0_1_IRQHandler
    .long   PWM0_2_IRQHandler           // PWM0_2_IRQHandler
    .long   QEI0_IRQHandler             // QEI0_IRQHandler
    .long   ADC0SS0_IRQHandler          // ADC0SS0_IRQHandler
    .long   ADC0SS1_IRQHandler          // ADC0SS1_IRQHandler
    .long   ADC0SS2_IRQHandler          // ADC0SS2_IRQHandler
    .long   ADC0SS3_IRQHandler          // ADC0SS3_IRQHandler
    .long   WATCHDOG0_IRQHandler        // WATCHDOG0_IRQHandler
    .long   TIMER0A_IRQHandler          // TIMER0A_IRQHandler
    .long   TIMER0B_IRQHandler          // TIMER0B_IRQHandler
    .long   TIMER1A_IRQHandler          // TIMER1A_IRQHandler
    .long   TIMER1B_IRQHandler          // TIMER1B_IRQHandler
    .long   TIMER2A_IRQHandler          // TIMER2A_IRQHandler
    .long   TIMER2B_IRQHandler          // TIMER2B_IRQHandler
    .long   COMP0_IRQHandler            // COMP0_IRQHandler
    .long   COMP1_IRQHandler            // COMP1_IRQHandler
    .long   COMP2_IRQHandler            // COMP2_IRQHandler
    .long   SYSCTL_IRQHandler           // SYSCTL_IRQHandler
    .long   FLASH_CTRL_IRQHandler       // FLASH_CTRL_IRQHandler
    .long   GPIOF_IRQHandler            // GPIOF_IRQHandler
    .long   GPIOG_IRQHandler            // GPIOG_IRQHandler
    .long   UART2_IRQHandler            // UART2_IRQHandler
    .long   TIMER3A_IRQHandler          // TIMER3A_IRQHandler
    .long   TIMER3B_IRQHandler          // TIMER3B_IRQHandler
    .long   I2C1_IRQHandler             // I2C1_IRQHandler
    .long   QEI1_IRQHandler             // QEI1_IRQHandler
    .long   ETH_IRQHandler              // ETH_IRQHandler
    .long   HIB_IRQHandler              // HIB_IRQHandler
    .long   PWM0_3_IRQHandler           // PWM0_3_IRQHandler
__vectors_end:
    .equ     __vectors_size, __vectors_end - __vectors
    .size   __vectors, . - __vectors

// Exception Handlers
    .thumb
    .section .text
    .align   2

    .thumb_func
    .type    Reset_Handler, %function
    .globl   Reset_Handler
    .fnstart
Reset_Handler:
    bl      SystemInit
// Single section scheme.
//
// The ranges of copy from/to are specified by following symbols
//   __etext: LMA of start of the section to copy from. Usually end of text
//   __data_start__: VMA of start of the section to copy to
//   __data_end__: VMA of end of the section to copy to
//
// All addresses must be aligned to 4 bytes boundary.
//
    ldr      r1, =__etext
    ldr      r2, =__data_start__
    ldr      r3, =__data_end__

.l_loop1:
    cmp      r2, r3
    ittt     lt
    ldrlt    r0, [r1], #4
    strlt    r0, [r2], #4
blt .l_loop1
// Single BSS section scheme.
//
// The BSS section is specified by following symbols
//   __bss_start__: start of the BSS section.
//   __bss_end__: end of the BSS section.
//
// Both addresses must be aligned to 4 bytes boundary.
    ldr      r1, =__bss_start__
    ldr      r2, =__bss_end__

    movs     r0, 0
.l_loop3:
    cmp      r1, r2
    itt      lt
    strlt    r0, [r1], #4
blt .l_loop3
    bl       _start
    .fnend
    .size Reset_Handler, . - Reset_Handler


    .thumb_func
    .type    Default_Handler, %function
    .weak    Default_Handler
    .fnstart
Default_Handler:
    b        .
    .fnend
    .size    Default_Handler, . - Default_Handler

// Macro to define default exception/interrupt handlers.
// Default handler are weak symbols with an endless loop.
// They can be overwritten by real handlers.
    .macro   IRQ  Handler_Name
    .weak    \Handler_Name
    .set     \Handler_Name, Default_Handler
    .endm

// Use the macro to configure the exceptions
    IRQ     NMI_Handler
    IRQ     HardFault_Handler
    IRQ     MemManage_Handler
    IRQ     BusFault_Handler
    IRQ     UsageFault_Handler
    IRQ     SVC_Handler
    IRQ     DebugMon_Handler
    IRQ     PendSV_Handler
    IRQ     SysTick_Handler
// Use the macro to configure the interrupts
    IRQ     GPIOA_IRQHandler
    IRQ     GPIOB_IRQHandler
    IRQ     GPIOC_IRQHandler
    IRQ     GPIOD_IRQHandler
    IRQ     GPIOE_IRQHandler
    IRQ     UART0_IRQHandler
    IRQ     UART1_IRQHandler
    IRQ     SSI0_IRQHandler
    IRQ     I2C0_IRQHandler
    IRQ     PWM0_FAULT_IRQHandler
    IRQ     PWM0_0_IRQHandler
    IRQ     PWM0_1_IRQHandler
    IRQ     PWM0_2_IRQHandler
    IRQ     QEI0_IRQHandler
    IRQ     ADC0SS0_IRQHandler
    IRQ     ADC0SS1_IRQHandler
    IRQ     ADC0SS2_IRQHandler
    IRQ     ADC0SS3_IRQHandler
    IRQ     WATCHDOG0_IRQHandler
    IRQ     TIMER0A_IRQHandler
    IRQ     TIMER0B_IRQHandler
    IRQ     TIMER1A_IRQHandler
    IRQ     TIMER1B_IRQHandler
    IRQ     TIMER2A_IRQHandler
    IRQ     TIMER2B_IRQHandler
    IRQ     COMP0_IRQHandler
    IRQ     COMP1_IRQHandler
    IRQ     COMP2_IRQHandler
    IRQ     SYSCTL_IRQHandler
    IRQ     FLASH_CTRL_IRQHandler
    IRQ     GPIOF_IRQHandler
    IRQ     GPIOG_IRQHandler
    IRQ     UART2_IRQHandler
    IRQ     TIMER3A_IRQHandler
    IRQ     TIMER3B_IRQHandler
    IRQ     I2C1_IRQHandler
    IRQ     QEI1_IRQHandler
    IRQ     ETH_IRQHandler
    IRQ     HIB_IRQHandler
    IRQ     PWM0_3_IRQHandler
// End of the file
    .end
