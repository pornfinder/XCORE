#pragma once

#include "memory.cpp"

void *realloc(void *ptr, size_t new_size) {
    if (!ptr) return allocate(new_size);
    if (new_size == 0) {
        free(ptr);
        return nullptr;
    }

    new_size = memory::align_size(new_size);
    auto *block = (memory_block *) ((char *) ptr - sizeof(memory_block));

    if (new_size <= block->size) {
        size_t remaining = block->size - new_size;
        if (remaining >= sizeof(memory_block) + MINB_SIZE) {
            auto *new_block = (memory_block *) (
                    (char *) block + sizeof(memory_block) + new_size
            );
            new_block->size = remaining - sizeof(memory_block);
            new_block->used = false;
            new_block->next = block->next;
            new_block->back = block;
            if (block->next) {
                block->next->back = new_block;
            }

            block->size = new_size;
            block->next = new_block;
        }
        return ptr;
    }

    if (block->next && !block->next->used) {
        size_t combined_size = block->size + sizeof(memory_block) + block->next->size;
        if (combined_size >= new_size) {
            block->size = combined_size;
            block->next = block->next->next;

            if (block->next) {
                block->next->back = block;
            }

            if (block->size - new_size >= sizeof(memory_block) + MINB_SIZE) {
                auto *new_block = (memory_block *) (
                        (char *) block + sizeof(memory_block) + new_size
                );
                new_block->size = block->size - new_size - sizeof(memory_block);
                new_block->used = false;
                new_block->next = block->next;
                new_block->back = block;
                if (block->next) {
                    block->next->back = new_block;
                }

                block->next = new_block;
                block->size = new_size;
            }

            return ptr;
        }
    }

    void *new_ptr = allocate(new_size);
    if (new_ptr) {
        size_t copy_size = (block->size < new_size) ? block->size : new_size;
        memcpy(new_ptr, ptr, copy_size);
        free(ptr);
    }

    return new_ptr;
}