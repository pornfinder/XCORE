#pragma once

#include "memory.cpp"

void *allocate(size_t size) {
    if (!size) return nullptr;

    size = memory::align_size(size);
    memory_block *block = memory::first;

    while (block->used || block->size < size) {
        if (block->next == nullptr) return nullptr;
        block = block->next;
    }

    block->used = true;

    size_t rem = block->size - size;
    if (rem >= sizeof(memory_block) + MINB_SIZE) {
        auto *new_block = (memory_block *) (
                (char *) block + sizeof(memory_block) + size
        );

        new_block->size = rem - sizeof(memory_block);
        new_block->used = false;
        new_block->next = block->next;
        new_block->back = block;

        block->size = size;
        block->next = new_block;
    }

    return (void *) ((char *) block + sizeof(memory_block));
}

void *calloc(size_t num, size_t size) {
    size_t total_size = num * size;
    void *ptr = allocate(total_size);

    if (ptr) {
        memzero(ptr, total_size);
    }

    return ptr;
}