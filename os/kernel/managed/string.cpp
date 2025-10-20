#pragma once

#include "managed.cpp"

struct string : public managed<char> {
    string(const char *s) : managed<char>() {
        nullend = true;

        while (*s != 0) push_back(*(s++));
    }
};

//string operator "" _s(const char *s) {
//    return {s};
//}