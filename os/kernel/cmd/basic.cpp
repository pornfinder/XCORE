#pragma once

#include "../types/scalar.cpp"
#include "../cpu/ports.cpp"

void reboot(char **) {
    outb(0x64, 0xFE);
    outb(0xCF9, 0x0E);

    asm volatile("int $0xFF");
    asm volatile("hlt");
}

void shutdown(char **) {
    auto *acpi_addr = (uint16_t *) 0x40E;
    auto *acpi_enable = (uint8_t *) 0x404;

    outb(*acpi_addr, *acpi_enable);
    for (volatile int i = 0; i < 100000; i++);

    outw(0x604, 0x2000);
    outw(0xB004, 0x2000);
    outw(0x4004, 0x3400);
    outw(0x5304, 0);
    outw(0x5301, 0);
    outw(0x5308, 1);
    outw(0x530E, 0);
    outw(0x530F, 1);
    outw(0x5307, 3);
    outb(*acpi_addr, 0x2000);

}