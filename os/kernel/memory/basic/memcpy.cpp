#pragma once

#include "../../types/scalar.cpp"

void memcpy(void *dest, const void *src, size_t count) {
    auto *d = (unsigned char *) dest;
    const auto *s = (const unsigned char *) src;

    if (count >= 4) {
        while (((uintptr_t) d & 3) && count > 0) {
            *d++ = *s++;
            count--;
        }

        auto *d_word = (uint32_t *) d;
        const auto *s_word = (const uint32_t *) s;

        while (count >= 4) {
            *d_word++ = *s_word++;
            count -= 4;
        }

        d = (unsigned char *) d_word;
        s = (const unsigned char *) s_word;
    }

    while (count > 0) {
        *d++ = *s++;
        count--;
    }

}