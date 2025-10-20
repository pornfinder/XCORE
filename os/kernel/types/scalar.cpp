#pragma once

typedef signed char int8_t;
typedef unsigned char uint8_t;

typedef signed short int16_t;
typedef unsigned short uint16_t;

typedef signed int int32_t;
typedef unsigned int uint32_t;

#ifdef __x86_64__
typedef signed long int64_t;
typedef unsigned long uint64_t;
#else
struct int64_t {
    int32_t low;
    int32_t high;
};

struct uint64_t {
    uint32_t low;
    uint32_t high;
};
#endif

typedef int32_t intptr_t;
typedef uint32_t uintptr_t;
typedef uint32_t size_t;
typedef int32_t ssize_t;

typedef uint16_t port_t;
typedef uint32_t phys_addr_t;
typedef uint32_t virt_addr_t;