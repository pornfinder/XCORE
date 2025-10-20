#pragma once

#include "../types/scalar.cpp"

size_t strlen(const char *str) {
    if (!str) {
        return 0;
    }

    size_t length = 0;
    while (str[length] != '\0') {
        length++;
    }

    return length;
}