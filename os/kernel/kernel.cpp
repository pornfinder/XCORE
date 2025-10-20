#pragma once

extern "C" void _start();
extern "C" void kernel_entry() {
    _start();
}

#include "console.cpp"

//Console console = Console();

#include "cpu/cpu.cpp"
#include "memory/memory.cpp"
#include "cmd/cmd.cpp"
#include "autotest/autotest.cpp"
#include "managed/managed.cpp"

extern "C" void _start() {
    exception::init();
    memory::init();
    autotest();

    Console console = Console();
    console.clear();
    
    string a = "Hello,";
    a += " world";
    a += '!';
    console.write(a.data());
}