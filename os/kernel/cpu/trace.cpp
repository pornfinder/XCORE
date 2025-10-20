#pragma once

#include "../types/types.cpp"
#include "../console.cpp"
#include "../memory/memory.cpp"

#define TRACE __PRETTY_FUNCTION__

struct TraceEntry {
    const char *func_name;
    uint32_t entry_addr;
    uint32_t call_time;
    uint32_t stack_depth;
};

class FunctionTracer {
public:
    static const int MAX_TRACES = 1000;
    static TraceEntry traces[MAX_TRACES];
    static int trace_count;
    static int current_depth;

    static void init() {
        trace_count = 0;
        current_depth = 0;
        memset(traces, 0, sizeof(traces));
    }

    static void enter_function(const char *name, uint32_t addr) {
        if (trace_count >= MAX_TRACES) return;

        traces[trace_count].func_name = name;
        traces[trace_count].entry_addr = addr;
        traces[trace_count].call_time = read_timer();
        traces[trace_count].stack_depth = current_depth++;

        trace_count++;
    }

    static void exit_function() {
        if (current_depth > 0) current_depth--;
    }

    static void dump_trace(Console &console, bool skip = true) {
        int skipcount = 4;
        for (int i = 0; i < trace_count; i++) {
            if (skip && i < skipcount) continue;
            for (int j = 0; j < traces[i].stack_depth; j++)
                console.write("  ");

            console.write("[");
            console.write(traces[i].stack_depth);
            console.write("] ");
            console.write(traces[i].func_name);
            console.write(" @ ");
            console.writeHex(traces[i].entry_addr);
            console.write(" T+");
            console.write(traces[i].call_time);
            console.writeLine("");
        }
    }

private:
    static uint32_t read_timer() {
        static uint32_t ticks = 0;
        return ticks++;
    }
};

TraceEntry FunctionTracer::traces[MAX_TRACES];
int FunctionTracer::trace_count = 0;
int FunctionTracer::current_depth = 0;

#define TRACE_ME FunctionTracerRAII __tracer_raii(__func__, __builtin_return_address(0))

class FunctionTracerRAII {
    const char *name;
public:
    FunctionTracerRAII(const char *func_name, uint32_t addr) : name(func_name) {
        FunctionTracer::enter_function(func_name, addr);
    }

    ~FunctionTracerRAII() {
        FunctionTracer::exit_function();
    }
};
//
extern "C" void __cyg_profile_func_enter(void *this_fn, void *call_site);
extern "C" void __cyg_profile_func_exit(void *this_fn, void *call_site);

extern "C" void __cyg_profile_func_enter(void *this_fn, void *call_site) {
    FunctionTracer::enter_function("instrumented", (uint32_t) this_fn);
}

extern "C" void __cyg_profile_func_exit(void *this_fn, void *call_site) {
    FunctionTracer::exit_function();
}

extern "C" void _Unwind_Resume() { while (1); }
extern "C" void __gxx_personality_v0() { while (1); }