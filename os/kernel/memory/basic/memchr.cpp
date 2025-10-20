#pragma once

#include "../../types/scalar.cpp"

void *memchr(const void *ptr, int value, size_t count) {
    const auto *p = (const unsigned char *) ptr;
    auto target = (unsigned char) value;

    for (size_t i = 0; i < count; i++) {
        if (p[i] == target) {
            return (void *) (p + i);
        }
    }

    return nullptr;
}

void *memcrt(void *ptr, char target, char value, size_t count) {
    auto *p = (unsigned char *) ptr;

    for (size_t i = 0; i < count; i++) {
        if (p[i] == target) {
            p[i] = value;
        }
    }

    return nullptr;
}