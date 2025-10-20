#pragma once

void panic(char *message);

#include "../../kernel.cpp"
#include "../../types/scalar.cpp"
#include "../registers.cpp"

void init_idt();

typedef void (*isr_t)(registers_t *);

struct exception {
    const static char *messages[];
    static isr_t interrupt_handlers[256];

    static void init() {
        init_idt();
    }
};

void panic(const char *message) {
    Console console = Console();
    console.clear();

    console.write("KERNEL PANIC: ");
    console.writeLine(message);

    debug_print_stacktrace(console);
    FunctionTracer::dump_trace(console);

    console.writeLine("System halted");
    while (true) { asm volatile ("hlt"); }
}

extern "C" {
void isr0();
void isr1();
void isr2();
void isr31();
}

const char *exception::messages[] = {
        "Division By Zero",
        "Debug",
        "Non Maskable Interrupt",
        "Breakpoint",
        "Into Detected Overflow",
        "Out of Bounds",
        "Invalid Opcode",
        "No Coprocessor",
        "Double Fault",
        "Coprocessor Segment Overrun",
        "Bad TSS",
        "Segment Not Present",
        "Stack Fault",
        "General Protection Fault",
        "Page Fault",
        "Unknown Interrupt",
        "Coprocessor Fault",
        "Alignment Check",
        "Machine Check",
        "Reserved",
        "Reserved",
        "Reserved",
        "Reserved",
        "Reserved",
        "Reserved",
        "Reserved",
        "Reserved",
        "Reserved",
        "Reserved",
        "Reserved",
        "Reserved",
        "Reserved"
};

isr_t exception::interrupt_handlers[256] = {};

#include "fault.cpp"
#include "idt.cpp"
