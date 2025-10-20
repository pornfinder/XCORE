#pragma once

#include "../../types/scalar.cpp"

void memmove(void *dest, const void *src, size_t count) {
    auto *d = (unsigned char *) dest;
    const auto *s = (const unsigned char *) src;

    if (d > s && d < s + count) {
        d += count;
        s += count;

        while (count > 0) {
            *--d = *--s;
            count--;
        }
    } else {
        for (size_t i = 0; i < count; i++) {
            d[i] = s[i];
        }
    }

}