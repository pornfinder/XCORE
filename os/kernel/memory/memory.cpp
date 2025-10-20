#pragma once

#define HEAP_SIZE (1024 * 1024)
#define MAXB_SIZE 512
#define MINB_SIZE 16
#define ALIGN 16

#include "../types/scalar.cpp"

struct memory_block {
    bool used;
    memory_block *next;
    memory_block *back;
    size_t size;
};

struct memory {
    static char heap[HEAP_SIZE];
    static memory_block *first;

    static void init() {
        first->size = HEAP_SIZE - sizeof(memory_block);
        first->used = false;
        first->next = nullptr;
    }

    static size_t align_size(size_t size) {
        if (size < MINB_SIZE) {
            size = MINB_SIZE;
        }

        size = (size + (ALIGN - 1)) & ~(ALIGN - 1);

        return size;
    }
};

char memory::heap[HEAP_SIZE] = {};
memory_block *memory::first = (memory_block *) memory::heap;

#include "basic/memchr.cpp"
#include "basic/memcmp.cpp"
#include "basic/memcpy.cpp"
#include "basic/memmove.cpp"
#include "basic/memset.cpp"
#include "allocate.cpp"
#include "free.cpp"
#include "realloc.cpp"


