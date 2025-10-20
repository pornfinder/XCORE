#pragma once

#include "scalar.cpp"

struct __attribute__((packed)) packed_uint16 {
    uint16_t value;
};

struct __attribute__((packed)) packed_uint32 {
    uint32_t value;
};

struct __attribute__((packed)) memory_mapped_register {
    volatile uint32_t value;
};