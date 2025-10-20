#pragma once

#include "../../types/scalar.cpp"

int memcmp(const void *ptr1, const void *ptr2, size_t count) {
    const auto *p1 = (const unsigned char *) ptr1;
    const auto *p2 = (const unsigned char *) ptr2;

    for (size_t i = 0; i < count; i++) {
        if (p1[i] != p2[i]) {
            return (int) p1[i] - (int) p2[i];
        }
    }

    return 0;
}