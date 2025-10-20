#pragma once

#include "../types/scalar.cpp"


struct registers_t {
    uint32_t eax, ebx, ecx, edx;
    uint32_t esi, edi, ebp, esp;

    uint32_t cs, ds, es, fs, gs, ss;

    uint32_t eip, eflags;

    uint32_t cr0, cr2, cr3, cr4;

    uint32_t int_no, err_code;

    uint32_t excesp;
};

extern "C" void get_all_registers(registers_t *regs) {
    if (!regs) return;

    asm volatile ("mov %%eax, %0" : "=r" (regs->eax));
    asm volatile ("mov %%ebx, %0" : "=r" (regs->ebx));
    asm volatile ("mov %%ecx, %0" : "=r" (regs->ecx));
    asm volatile ("mov %%edx, %0" : "=r" (regs->edx));
    asm volatile ("mov %%esi, %0" : "=r" (regs->esi));
    asm volatile ("mov %%edi, %0" : "=r" (regs->edi));
    asm volatile ("mov %%ebp, %0" : "=r" (regs->ebp));
    asm volatile ("mov %%esp, %0" : "=r" (regs->esp));

    asm volatile ("mov %%cs, %0" : "=r" (regs->cs));
    asm volatile ("mov %%ds, %0" : "=r" (regs->ds));
    asm volatile ("mov %%es, %0" : "=r" (regs->es));
    asm volatile ("mov %%fs, %0" : "=r" (regs->fs));
    asm volatile ("mov %%gs, %0" : "=r" (regs->gs));
    asm volatile ("mov %%ss, %0" : "=r" (regs->ss));

    asm volatile (
            "call 1f\n\t"
            "1: pop %0\n\t"
            : "=r" (regs->eip)
            );
    regs->eip -= 5;

    asm volatile ("pushf\n\tpop %0" : "=r" (regs->eflags));

    asm volatile ("mov %%cr0, %0" : "=r" (regs->cr0));
    asm volatile ("mov %%cr2, %0" : "=r" (regs->cr2));
    asm volatile ("mov %%cr3, %0" : "=r" (regs->cr3));
    asm volatile ("mov %%cr4, %0" : "=r" (regs->cr4));
}

extern "C" void get_basic_registers(registers_t *regs) {
    if (!regs) return;

    asm volatile ("mov %%eax, %0" : "=r" (regs->eax));
    asm volatile ("mov %%ebx, %0" : "=r" (regs->ebx));
    asm volatile ("mov %%ecx, %0" : "=r" (regs->ecx));
    asm volatile ("mov %%edx, %0" : "=r" (regs->edx));
    asm volatile ("mov %%esi, %0" : "=r" (regs->esi));
    asm volatile ("mov %%edi, %0" : "=r" (regs->edi));
    asm volatile ("mov %%ebp, %0" : "=r" (regs->ebp));
    asm volatile ("mov %%esp, %0" : "=r" (regs->esp));

    asm volatile ("mov %%cs, %0" : "=r" (regs->cs));
    asm volatile ("mov %%ds, %0" : "=r" (regs->ds));

    asm volatile (
            "call 1f\n\t"
            "1: pop %0\n\t"
            : "=r" (regs->eip)
            );
    regs->eip -= 5;

    asm volatile ("pushf\n\tpop %0" : "=r" (regs->eflags));
    asm volatile ("mov %%cr2, %0" : "=r" (regs->cr2));
}

extern "C" void get_registers_safe(registers_t *regs) {
    if (!regs) return;

    asm volatile (
            "movl %%eax, 0(%0)\n\t"
            "movl %%ebx, 4(%0)\n\t"
            "movl %%ecx, 8(%0)\n\t"
            "movl %%edx, 12(%0)\n\t"
            "movl %%esi, 16(%0)\n\t"
            "movl %%edi, 20(%0)\n\t"
            "movl %%ebp, 24(%0)\n\t"
            "movl %%esp, 28(%0)\n\t"
            :
            : "r" (regs)
            : "memory"
            );

    asm volatile ("mov %%cs, %0" : "=r" (regs->cs));
    asm volatile ("mov %%ds, %0" : "=r" (regs->ds));

    asm volatile (
            "call 1f\n\t"
            "1: pop %0\n\t"
            : "=r" (regs->eip)
            );
    regs->eip -= 5;

    asm volatile ("pushf\n\tpop %0" : "=r" (regs->eflags));
}