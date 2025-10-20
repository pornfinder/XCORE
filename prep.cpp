# 0 "os/kernel/kernel.cpp"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "os/kernel/kernel.cpp"
       

extern "C" void _start();
extern "C" void kernel_entry() {
    _start();
}

# 1 "os/kernel/console.cpp" 1
       

# 1 "os/kernel/utils/utils.cpp" 1
       

# 1 "os/kernel/utils/atoi.cpp" 1
       

int char_to_digit(char c) {
    if (c >= '0' && c <= '9') return c - '0';
    if (c >= 'a' && c <= 'z') return c - 'a' + 10;
    if (c >= 'A' && c <= 'Z') return c - 'A' + 10;
    return -1;
}

int str_to_int(const char *str, char **endptr, int base) {
    while (*str == ' ' || *str == '\t' || *str == '\n') {
        str++;
    }

    int sign = 1;
    if (*str == '-') {
        sign = -1;
        str++;
    } else if (*str == '+') {
        str++;
    }

    if (base == 0) {
        if (*str == '0') {
            if (*(str + 1) == 'x' || *(str + 1) == 'X') {
                base = 16;
                str += 2;
            } else {
                base = 8;
                str++;
            }
        } else {
            base = 10;
        }
    }

    if (base == 16 && *str == '0' && (*(str + 1) == 'x' || *(str + 1) == 'X')) {
        str += 2;
    }

    int result = 0;

    while (*str != '\0') {
        int digit = char_to_digit(*str);

        if (digit < 0 || digit >= base) {
            break;
        }

        if (result > (0x7FFFFFFF - digit) / base) {
            result = 0x7FFFFFFF;
            break;
        }

        result = result * base + digit;
        str++;
    }

    if (endptr != nullptr) {
        *endptr = (char *) str;
    }

    return sign * result;
}

int atoi(const char *str) {
    return str_to_int(str, nullptr, 10);
}

int atoi_hex(const char *str) {
    return str_to_int(str, nullptr, 16);
}

int atoi_bin(const char *str) {
    return str_to_int(str, nullptr, 2);
}
# 4 "os/kernel/utils/utils.cpp" 2
# 1 "os/kernel/utils/itoa.cpp" 1
       

char digit_to_char(int digit) {
    if (digit >= 0 && digit <= 9) return '0' + digit;
    if (digit >= 10 && digit <= 35) return 'a' + (digit - 10);
    return '?';
}

char *itoa(int value, char *buffer, int base) {
    if (base < 2 || base > 36) {
        buffer[0] = '\0';
        return buffer;
    }

    if (value == 0) {
        buffer[0] = '0';
        buffer[1] = '\0';
        return buffer;
    }

    char temp_buffer[32];
    int index = 0;
    bool negative = false;

    unsigned int unsigned_value;
    if (value < 0 && base == 10) {
        negative = true;
        unsigned_value = (unsigned int) (-value);
    } else {
        unsigned_value = (unsigned int) value;
    }

    do {
        int digit = unsigned_value % base;
        temp_buffer[index++] = digit_to_char(digit);
        unsigned_value /= base;
    } while (unsigned_value != 0);

    if (negative) {
        temp_buffer[index++] = '-';
    }

    int buf_index = 0;
    for (int i = index - 1; i >= 0; i--) {
        buffer[buf_index++] = temp_buffer[i];
    }
    buffer[buf_index] = '\0';

    return buffer;
}

char *itoa_dec(int value, char *buffer) {
    return itoa(value, buffer, 10);
}

char *itoa_hex(int value, char *buffer) {
    return itoa(value, buffer, 16);
}

char *itoa_bin(int value, char *buffer) {
    return itoa(value, buffer, 2);
}

char *utoa(unsigned int value, char *buffer, int base) {
    if (base < 2 || base > 36) {
        buffer[0] = '\0';
        return buffer;
    }

    if (value == 0) {
        buffer[0] = '0';
        buffer[1] = '\0';
        return buffer;
    }

    char temp_buffer[32];
    int index = 0;

    do {
        int digit = value % base;
        temp_buffer[index++] = digit_to_char(digit);
        value /= base;
    } while (value != 0);

    int buf_index = 0;
    for (int i = index - 1; i >= 0; i--) {
        buffer[buf_index++] = temp_buffer[i];
    }
    buffer[buf_index] = '\0';

    return buffer;
}
# 5 "os/kernel/utils/utils.cpp" 2
# 1 "os/kernel/utils/basicmath.cpp" 1
       

int min(int a, int b) {
    return a < b ? a : b;
}

int max(int a, int b) {
    return a > b ? a : b;
}

int abs(int a) {
    return a < 0 ? -a : a;
}

int sign(int a) {
    return a < 0 ? -1 : 1;
}
# 6 "os/kernel/utils/utils.cpp" 2
# 1 "os/kernel/utils/strings.cpp" 1
       

# 1 "os/kernel/utils/../types/scalar.cpp" 1
       

typedef signed char int8_t;
typedef unsigned char uint8_t;

typedef signed short int16_t;
typedef unsigned short uint16_t;

typedef signed int int32_t;
typedef unsigned int uint32_t;


typedef signed long int64_t;
typedef unsigned long uint64_t;
# 27 "os/kernel/utils/../types/scalar.cpp"
typedef int32_t intptr_t;
typedef uint32_t uintptr_t;
typedef uint32_t size_t;
typedef int32_t ssize_t;

typedef uint16_t port_t;
typedef uint32_t phys_addr_t;
typedef uint32_t virt_addr_t;
# 4 "os/kernel/utils/strings.cpp" 2

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
# 7 "os/kernel/utils/utils.cpp" 2
# 4 "os/kernel/console.cpp" 2

inline void int_to_hex(unsigned int number, char *buffer) {
    const char hex_chars[] = "0123456789ABCDEF";
    int i = 0;
    int shift = 28;

    while (shift > 0) {
        int digit = (number >> shift) & 0xF;
        if (digit != 0) break;
        shift -= 4;
    }

    while (shift >= 0) {
        int digit = (number >> shift) & 0xF;
        buffer[i++] = hex_chars[digit];
        shift -= 4;
    }

    if (i == 0) buffer[i++] = '0';
    buffer[i] = '\0';
}

struct Console {
    volatile unsigned short *buffer;
    int cursor_x, cursor_y;

    static char scancode_normal[128];
    static char scancode_shift[128];
    static bool shift_pressed;
    static bool caps_lock;

    explicit Console(unsigned short *buffer) {
        this->buffer = buffer;
        cursor_x = 0;
        cursor_y = 0;
        shift_pressed = false;
        caps_lock = false;
        init_scancode_tables();
    }

    explicit Console(int bufaddr = 0xB8000) {
        buffer = (volatile unsigned short *) bufaddr;
        cursor_x = 0;
        cursor_y = 0;
        shift_pressed = false;
        caps_lock = false;
        init_scancode_tables();
    }

private:
    void init_scancode_tables() {
        const char normal_init[128] = {
                0, 27, '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '-', '=', '\b',
                '\t', 'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', '[', ']', '\n',
                0, 'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', ';', '\'', '`',
                0, '\\', 'z', 'x', 'c', 'v', 'b', 'n', 'm', ',', '.', '/', 0,
                '*', 0, ' ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, '-', 0, 0, 0, '+', 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        };

        const char shift_init[128] = {
                0, 27, '!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '_', '+', '\b',
                '\t', 'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P', '{', '}', '\n',
                0, 'A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L', ':', '"', '~',
                0, '|', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', '<', '>', '?', 0,
                '*', 0, ' ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, '-', 0, 0, 0, '+', 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        };

        for (int i = 0; i < 128; i++) {
            scancode_normal[i] = normal_init[i];
            scancode_shift[i] = shift_init[i];
        }
    }

    void show_cursor() {
        if (cursor_x < 80 && cursor_y < 25) {
            int offset = cursor_y * 80 + cursor_x;
            buffer[offset] = (0x70 << 8) | ' ';
        }
    }

    void hide_cursor() {
        if (cursor_x < 80 && cursor_y < 25) {
            int offset = cursor_y * 80 + cursor_x;
            buffer[offset] = (0x07 << 8) | ' ';
        }
    }

public:
    static unsigned char inb(unsigned short port) {
        unsigned char result;

        asm volatile (
                "movw %1, %%dx\n\t"
                "inb %%dx, %%al"
                : "=a" (result)
                : "r" (port)
                : "dx"
                );
        return result;
    }

    static void outb(unsigned short port, unsigned char data) {
        asm volatile ("outb %0, %1" : : "a" (data), "Nd" (port));
    }

    void handle_scancode(unsigned char scancode) {
        if (scancode & 0x80) {
            unsigned char key = scancode & 0x7F;
            if (key == 0x2A || key == 0x36) shift_pressed = false;
            return;
        }

        switch (scancode) {
            case 0x2A:
            case 0x36:
                shift_pressed = true;
                break;
            case 0x3A:
                caps_lock = !caps_lock;
                break;
            default:
                break;
        }
    }

    char get_char(unsigned char scancode) {
        if (scancode >= 128) return 0;
        char ch = shift_pressed ? scancode_shift[scancode] : scancode_normal[scancode];

        if (caps_lock && !shift_pressed) {
            if (ch >= 'a' && ch <= 'z') ch -= 32;
            else if (ch >= 'A' && ch <= 'Z') ch += 32;
        }
        return ch;
    }


    void readLine(char *output_buffer, int max_len) {

        int pos = 0;
        output_buffer[0] = '\0';

        int input_start_x = cursor_x;
        int input_start_y = cursor_y;

        while (true) {
            show_cursor();

            char ch = readChar();
            hide_cursor();

            if (ch == '\n') {
                output_buffer[pos] = '\0';
                write("\n");
                return;
            } else if (ch == '\b') {
                if (pos > 0) {
                    pos--;
                    output_buffer[pos] = '\0';

                    cursor_x--;
                    if (cursor_x < input_start_x) {
                        cursor_x = 79;
                        cursor_y--;
                        if (cursor_y < input_start_y) cursor_y = input_start_y;
                    }
                    buffer[cursor_y * 80 + cursor_x] = (0x07 << 8) | ' ';
                }
            } else if (ch >= 32 && ch <= 126 && pos < max_len - 1) {
                output_buffer[pos] = ch;
                pos++;
                output_buffer[pos] = '\0';

                buffer[cursor_y * 80 + cursor_x] = (0x07 << 8) | ch;
                cursor_x++;

                if (cursor_x >= 80) {
                    cursor_x = 0;
                    cursor_y++;
                    if (cursor_y >= 25) {
                        scroll();
                        cursor_y = 24;
                    }
                }
            }

            show_cursor();
            while (get_char(inb(0x60)) != 0);

        }
    }

    void scroll() {
        for (int i = 0; i < 80 * 24; i++) {
            buffer[i] = buffer[i + 80];
        }
        for (int i = 80 * 24; i < 80 * 25; i++) {
            buffer[i] = 0x0720;
        }
    }

    void clear() {
        for (int i = 0; i < 80 * 25; i++) {
            buffer[i] = 0x0720;
        }
        cursor_x = 0;
        cursor_y = 0;
    }

    void place(const char *str, int x, int y) {
        int offset = y * 80 + x;
        for (int i = 0; str[i] != '\0'; i++) {
            buffer[offset + i] = (0x07 << 8) | str[i];
        }
    }

    void write(const char *str) {
        for (int i = 0; str[i] != '\0'; i++) {
            if (str[i] == '\n') {
                cursor_x = 0;
                cursor_y++;
                if (cursor_y >= 25) {
                    scroll();
                    cursor_y = 24;
                }
            } else {
                int offset = cursor_y * 80 + cursor_x;
                buffer[offset] = (0x07 << 8) | str[i];

                cursor_x++;
                if (cursor_x >= 80) {
                    cursor_x = 0;
                    cursor_y++;
                    if (cursor_y >= 25) {
                        scroll();
                        cursor_y = 24;
                    }
                }
            }
        }
    }

    void write(int val) {
        char buf[16];
        itoa(val, buf, 10);
        write(buf);
    }

    void writeHex(int val, bool x = true) {
        char buf[16];
        writeHexFromBuffer(val, buf, x);
    }

    void writeHexFromBuffer(int val, char buf[], bool x = true) {
        int_to_hex(val, buf);
        if (x) write("0x");
        write(buf);
    }

    void writeLine(const char *str) {
        write(str);
        write("\n");
    }

    void set_cursor(int x, int y) {
        cursor_x = x;
        cursor_y = y;
        if (cursor_x >= 80) cursor_x = 79;
        if (cursor_y >= 25) cursor_y = 24;
        if (cursor_x < 0) cursor_x = 0;
        if (cursor_y < 0) cursor_y = 0;
    }

    void get_cursor(int &x, int &y) {
        x = cursor_x;
        y = cursor_y;
    }

    char readChar() {
        while (get_char(inb(0x60)) != 0);

        while (true) {
            char c = get_char(Console::inb(0x60));
            if (c != 0) {
                return c;
            }
        }
    }

    bool hasInput() {
        unsigned char status = inb(0x64);
        return (status & 0x01) != 0;
    }

    void prompt(const char *message, char *buffer, int max_len) {
        write(message);

        readLine(buffer, max_len);
    }

    bool isShiftPressed() { return shift_pressed; }

    bool isCapsLock() { return caps_lock; }
};

char Console::scancode_normal[128] = {
        0, 27, '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '-', '=', '\b',
        '\t', 'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', '[', ']', '\n',
        0, 'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', ';', '\'', '`',
        0, '\\', 'z', 'x', 'c', 'v', 'b', 'n', 'm', ',', '.', '/', 0,
        '*', 0, ' ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, '-', 0, 0, 0, '+', 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};

char Console::scancode_shift[128] = {
        0, 27, '!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '_', '+', '\b',
        '\t', 'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P', '{', '}', '\n',
        0, 'A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L', ':', '"', '~',
        0, '|', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', '<', '>', '?', 0,
        '*', 0, ' ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, '-', 0, 0, 0, '+', 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};

bool Console::shift_pressed = false;
bool Console::caps_lock = false;
# 9 "os/kernel/kernel.cpp" 2



# 1 "os/kernel/cpu/cpu.cpp" 1
       

# 1 "os/kernel/cpu/registers.cpp" 1
       




struct registers_t {
    uint32_t eax, ebx, ecx, edx;
    uint32_t esi, edi, ebp, esp;

    uint32_t cs, ds, es, fs, gs, ss;

    uint32_t eip, eflags;

    uint32_t cr0, cr2, cr3, cr4;

    uint32_t int_no, err_code;

    uint32_t excesp;
};

extern "C" void get_all_registers(registers_t *regs) {
    if (!regs) return;

    asm volatile ("mov %%eax, %0" : "=r" (regs->eax));
    asm volatile ("mov %%ebx, %0" : "=r" (regs->ebx));
    asm volatile ("mov %%ecx, %0" : "=r" (regs->ecx));
    asm volatile ("mov %%edx, %0" : "=r" (regs->edx));
    asm volatile ("mov %%esi, %0" : "=r" (regs->esi));
    asm volatile ("mov %%edi, %0" : "=r" (regs->edi));
    asm volatile ("mov %%ebp, %0" : "=r" (regs->ebp));
    asm volatile ("mov %%esp, %0" : "=r" (regs->esp));

    asm volatile ("mov %%cs, %0" : "=r" (regs->cs));
    asm volatile ("mov %%ds, %0" : "=r" (regs->ds));
    asm volatile ("mov %%es, %0" : "=r" (regs->es));
    asm volatile ("mov %%fs, %0" : "=r" (regs->fs));
    asm volatile ("mov %%gs, %0" : "=r" (regs->gs));
    asm volatile ("mov %%ss, %0" : "=r" (regs->ss));

    asm volatile (
            "call 1f\n\t"
            "1: pop %0\n\t"
            : "=r" (regs->eip)
            );
    regs->eip -= 5;

    asm volatile ("pushf\n\tpop %0" : "=r" (regs->eflags));

    asm volatile ("mov %%cr0, %0" : "=r" (regs->cr0));
    asm volatile ("mov %%cr2, %0" : "=r" (regs->cr2));
    asm volatile ("mov %%cr3, %0" : "=r" (regs->cr3));
    asm volatile ("mov %%cr4, %0" : "=r" (regs->cr4));
}

extern "C" void get_basic_registers(registers_t *regs) {
    if (!regs) return;

    asm volatile ("mov %%eax, %0" : "=r" (regs->eax));
    asm volatile ("mov %%ebx, %0" : "=r" (regs->ebx));
    asm volatile ("mov %%ecx, %0" : "=r" (regs->ecx));
    asm volatile ("mov %%edx, %0" : "=r" (regs->edx));
    asm volatile ("mov %%esi, %0" : "=r" (regs->esi));
    asm volatile ("mov %%edi, %0" : "=r" (regs->edi));
    asm volatile ("mov %%ebp, %0" : "=r" (regs->ebp));
    asm volatile ("mov %%esp, %0" : "=r" (regs->esp));

    asm volatile ("mov %%cs, %0" : "=r" (regs->cs));
    asm volatile ("mov %%ds, %0" : "=r" (regs->ds));

    asm volatile (
            "call 1f\n\t"
            "1: pop %0\n\t"
            : "=r" (regs->eip)
            );
    regs->eip -= 5;

    asm volatile ("pushf\n\tpop %0" : "=r" (regs->eflags));
    asm volatile ("mov %%cr2, %0" : "=r" (regs->cr2));
}

extern "C" void get_registers_safe(registers_t *regs) {
    if (!regs) return;

    asm volatile (
            "movl %%eax, 0(%0)\n\t"
            "movl %%ebx, 4(%0)\n\t"
            "movl %%ecx, 8(%0)\n\t"
            "movl %%edx, 12(%0)\n\t"
            "movl %%esi, 16(%0)\n\t"
            "movl %%edi, 20(%0)\n\t"
            "movl %%ebp, 24(%0)\n\t"
            "movl %%esp, 28(%0)\n\t"
            :
            : "r" (regs)
            : "memory"
            );

    asm volatile ("mov %%cs, %0" : "=r" (regs->cs));
    asm volatile ("mov %%ds, %0" : "=r" (regs->ds));

    asm volatile (
            "call 1f\n\t"
            "1: pop %0\n\t"
            : "=r" (regs->eip)
            );
    regs->eip -= 5;

    asm volatile ("pushf\n\tpop %0" : "=r" (regs->eflags));
}
# 4 "os/kernel/cpu/cpu.cpp" 2
# 1 "os/kernel/cpu/stacktrace.cpp" 1



struct StackFrame {
    StackFrame *next;
    uint32_t return_addr;
};

extern "C" void debug_print_stacktrace(Console &console, bool skip = false, uint32_t max_frames = 10) {
    console.writeLine("\nStack trace:");

    StackFrame *frame;
    asm volatile ("mov %%ebp, %0" : "=r"(frame));

    bool interrupt = false;

    int skipcount = 4;

    for (uint32_t i = 0; frame && i < max_frames; i++) {
        if (skip && skipcount) {
            skipcount--;
            i--;
            frame = frame->next;
            continue;
        }

        console.write("  #");
        console.write(i);
        console.write(": [EBP=");
        console.writeHex((uint32_t) frame);
        console.write("] RET=");
        console.writeHex(frame->return_addr);
        if (interrupt) {
            console.write(" <-- INTERRUPT");
            interrupt = false;
        }
        if (frame->return_addr == 0x6) {
            interrupt = true;
        }
        console.writeLine("");

        if (!frame->next || (uint32_t) frame->next < 0x10000 || (uint32_t) frame->next > 0x9FFFF)
            break;

        frame = frame->next;
    }
}

extern "C" void debug_dump_full_context(registers_t *regs, Console &console) {

    console.writeLine("\n=== FULL EXCEPTION CONTEXT ===");

    console.write("EAX: ");
    console.writeHex(regs->eax);
    console.write(" EBX: ");
    console.writeHex(regs->ebx);
    console.write(" ECX: ");
    console.writeHex(regs->ecx);
    console.write(" EDX: ");
    console.writeHex(regs->edx);
    console.writeLine("");

    console.write("ESP: ");
    console.writeHex(regs->esp);
    console.write(" EBP: ");
    console.writeHex(regs->ebp);
    console.write(" EIP: ");
    console.writeHex(regs->eip);
    console.writeLine("");

    console.writeLine("\nStack around EBP:");
    uint32_t *stack_ptr = (uint32_t *) (regs->ebp & 0xFFFFFFF0);

    for (int i = 0; i < 8; i++) {
        console.write("  [");
        console.writeHex((uint32_t) stack_ptr);
        console.write("] = ");
        console.writeHex(*stack_ptr);

        if (stack_ptr == (uint32_t *) regs->ebp)
            console.write(" <-- EBP");
        else if (*stack_ptr == regs->eip)
            console.write(" <-- EIP");

        console.writeLine("");
        stack_ptr++;
    }

    debug_print_stacktrace(console);
}
# 5 "os/kernel/cpu/cpu.cpp" 2
# 1 "os/kernel/cpu/trace.cpp" 1
       

# 1 "os/kernel/cpu/../types/types.cpp" 1
       

# 1 "os/kernel/cpu/../types/aligned.cpp" 1
       



struct __attribute__((packed)) packed_uint16 {
    uint16_t value;
};

struct __attribute__((packed)) packed_uint32 {
    uint32_t value;
};

struct __attribute__((packed)) memory_mapped_register {
    volatile uint32_t value;
};
# 4 "os/kernel/cpu/../types/types.cpp" 2
# 1 "os/kernel/cpu/../types/constant.cpp" 1
       
# 5 "os/kernel/cpu/../types/types.cpp" 2
# 4 "os/kernel/cpu/trace.cpp" 2

# 1 "os/kernel/cpu/../memory/memory.cpp" 1
       
# 10 "os/kernel/cpu/../memory/memory.cpp"
struct memory_block {
    bool used;
    memory_block *next;
    memory_block *back;
    size_t size;
};

struct memory {
    static char heap[(1024 * 1024)];
    static memory_block *first;

    static void init() {
        first->size = (1024 * 1024) - sizeof(memory_block);
        first->used = false;
        first->next = nullptr;
    }

    static size_t align_size(size_t size) {
        if (size < 16) {
            size = 16;
        }

        size = (size + (16 - 1)) & ~(16 - 1);

        return size;
    }
};

char memory::heap[(1024 * 1024)] = {};
memory_block *memory::first = (memory_block *) memory::heap;

# 1 "os/kernel/cpu/../memory/basic/memchr.cpp" 1
       



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
# 42 "os/kernel/cpu/../memory/memory.cpp" 2
# 1 "os/kernel/cpu/../memory/basic/memcmp.cpp" 1
       



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
# 43 "os/kernel/cpu/../memory/memory.cpp" 2
# 1 "os/kernel/cpu/../memory/basic/memcpy.cpp" 1
       



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
# 44 "os/kernel/cpu/../memory/memory.cpp" 2
# 1 "os/kernel/cpu/../memory/basic/memmove.cpp" 1
       



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
# 45 "os/kernel/cpu/../memory/memory.cpp" 2
# 1 "os/kernel/cpu/../memory/basic/memset.cpp" 1
       



void memset(void *dest, int value, size_t count) {
    auto *ptr = (unsigned char *) dest;
    auto byte_value = (unsigned char) value;

    if (count >= 4) {
        uint32_t word_value = byte_value | (byte_value << 8) |
                              (byte_value << 16) | (byte_value << 24);

        while (((uintptr_t) ptr & 3) && count > 0) {
            *ptr++ = byte_value;
            count--;
        }

        auto *word_ptr = (uint32_t *) ptr;
        while (count >= 4) {
            *word_ptr++ = word_value;
            count -= 4;
        }

        ptr = (unsigned char *) word_ptr;
    }

    while (count > 0) {
        *ptr++ = byte_value;
        count--;
    }

}

void memzero(void *dest, size_t count) {
    memset(dest, 0, count);
}
# 46 "os/kernel/cpu/../memory/memory.cpp" 2
# 1 "os/kernel/cpu/../memory/allocate.cpp" 1
       



void *allocate(size_t size) {
    if (!size) return nullptr;

    size = memory::align_size(size);
    memory_block *block = memory::first;

    while (block->used || block->size < size) {
        if (block->next == nullptr) return nullptr;
        block = block->next;
    }

    block->used = true;

    size_t rem = block->size - size;
    if (rem >= sizeof(memory_block) + 16) {
        auto *new_block = (memory_block *) (
                (char *) block + sizeof(memory_block) + size
        );

        new_block->size = rem - sizeof(memory_block);
        new_block->used = false;
        new_block->next = block->next;
        new_block->back = block;

        block->size = size;
        block->next = new_block;
    }

    return (void *) ((char *) block + sizeof(memory_block));
}

void *calloc(size_t num, size_t size) {
    size_t total_size = num * size;
    void *ptr = allocate(total_size);

    if (ptr) {
        memzero(ptr, total_size);
    }

    return ptr;
}
# 47 "os/kernel/cpu/../memory/memory.cpp" 2
# 1 "os/kernel/cpu/../memory/free.cpp" 1
       



void free(void *ptr) {
    if (!ptr) return;

    auto *block = (memory_block *) ((char *) ptr - sizeof(memory_block));

    block->used = false;

    if (block->back && !block->back->used) {
        size_t original_size = block->size;

        block->back->size += original_size + sizeof(memory_block);
        block->back->next = block->next;

        if (block->next) {
            block->next->back = block->back;
        }

        block = block->back;
    }

    if (block->next && !block->next->used) {
        block->size += block->next->size + sizeof(memory_block);
        block->next = block->next->next;

        if (block->next) {
            block->next->back = block;
        }
    }
}
# 48 "os/kernel/cpu/../memory/memory.cpp" 2
# 1 "os/kernel/cpu/../memory/realloc.cpp" 1
       



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
        if (remaining >= sizeof(memory_block) + 16) {
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

            if (block->size - new_size >= sizeof(memory_block) + 16) {
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
# 49 "os/kernel/cpu/../memory/memory.cpp" 2
# 6 "os/kernel/cpu/trace.cpp" 2



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
# 6 "os/kernel/cpu/cpu.cpp" 2
# 1 "os/kernel/cpu/ports.cpp" 1
       



static inline uint8_t inb(uint16_t port) {
    uint8_t result;
    asm volatile ("inb %w1, %b0"
            : "=a" (result)
            : "Nd" (port));
    return result;
}

static inline void outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %b0, %w1"
            :
            : "a" (data), "Nd" (port));
}

static inline uint16_t inw(uint16_t port) {
    uint16_t result;
    asm volatile ("inw %w1, %w0"
            : "=a" (result)
            : "Nd" (port));
    return result;
}

static inline void outw(uint16_t port, uint16_t data) {
    asm volatile ("outw %w0, %w1"
            :
            : "a" (data), "Nd" (port));
}
# 7 "os/kernel/cpu/cpu.cpp" 2
# 1 "os/kernel/cpu/exceptions/exceptions.cpp" 1
       

void panic(char *message);





void init_idt();

typedef void (*isr_t)(registers_t *);

struct exception {
    const static char *messages[];
    static isr_t interrupt_handlers[256];

    static void init() {
        init_idt();
    }
};

void panic(const char *message) {
    Console console = Console();
    console.clear();

    console.write("KERNEL PANIC: ");
    console.writeLine(message);

    debug_print_stacktrace(console);
    FunctionTracer::dump_trace(console);

    console.writeLine("System halted");
    while (true) { asm volatile ("hlt"); }
}

extern "C" {
void isr0();
void isr1();
void isr2();
void isr31();
}

const char *exception::messages[] = {
        "Division By Zero",
        "Debug",
        "Non Maskable Interrupt",
        "Breakpoint",
        "Into Detected Overflow",
        "Out of Bounds",
        "Invalid Opcode",
        "No Coprocessor",
        "Double Fault",
        "Coprocessor Segment Overrun",
        "Bad TSS",
        "Segment Not Present",
        "Stack Fault",
        "General Protection Fault",
        "Page Fault",
        "Unknown Interrupt",
        "Coprocessor Fault",
        "Alignment Check",
        "Machine Check",
        "Reserved",
        "Reserved",
        "Reserved",
        "Reserved",
        "Reserved",
        "Reserved",
        "Reserved",
        "Reserved",
        "Reserved",
        "Reserved",
        "Reserved",
        "Reserved",
        "Reserved"
};

isr_t exception::interrupt_handlers[256] = {};

# 1 "os/kernel/cpu/exceptions/fault.cpp" 1
       






void find_ud2_in_memory(Console console) {
    uint8_t *kernel_start = (uint8_t *) 0x10000;
    uint32_t kernel_size = 0x10000;

    for (uint32_t i = 0; i < kernel_size - 1; i++) {
        if (kernel_start[i] == 0x0F && kernel_start[i + 1] == 0x0B) {
            console.write("Found UD2 at: ");
            console.writeHex(0x10000 + i);
            console.writeLine("");
        }
    }
}


void fault_handler(registers_t *regs) {
    Console console;

    uint32_t original_eip;


    asm volatile (
            "mov 8(%%esp), %0\n\t"
            : "=r" (original_eip)
            :
            : "memory"
            );

    regs->eip = original_eip;

    panic(exception::messages[regs->int_no]);
}

static void page_fault_handler(registers_t *regs) {
    uint32_t faulting_address;
    asm volatile("mov %%cr2, %0" : "=r" (faulting_address));

    Console console;
    console.write("Page Fault at ");
    console.writeHex(faulting_address);
    console.writeLine("");

    while (1) asm volatile("hlt");
}
# 81 "os/kernel/cpu/exceptions/exceptions.cpp" 2
# 1 "os/kernel/cpu/exceptions/idt.cpp" 1
       


# 1 "os/kernel/cpu/exceptions/handlers.cpp" 1
       





extern "C" void universal_fault_handler(uint32_t int_no, uint32_t err_code) {
    registers_t regs = {};

    get_basic_registers(&regs);

    regs.int_no = int_no;
    regs.err_code = err_code;

    uint32_t current_esp;
    asm volatile ("mov %%esp, %0" : "=r" (current_esp));
    regs.excesp = current_esp;


    uint32_t *stack = (uint32_t *) current_esp;

    bool has_error_code = (int_no == 8 || (int_no >= 10 && int_no <= 14) || int_no == 17);

    if (has_error_code) {
        regs.eip = stack[1];
        regs.cs = stack[2];
        regs.eflags = stack[3];
    } else {
        regs.eip = stack[0];
        regs.cs = stack[1];
        regs.eflags = stack[2];
    }

    fault_handler(&regs);

    while (1) {
        asm volatile("hlt");
    }
}
# 59 "os/kernel/cpu/exceptions/handlers.cpp"
extern "C" void isr_common() {
    asm volatile (
            "pusha\n\t"
            "pushl %ds\n\t"
            "pushl %es\n\t"
            "pushl %fs\n\t"
            "pushl %gs\n\t"

            "movw $0x10, %ax\n\t"
            "movw %ax, %ds\n\t"
            "movw %ax, %es\n\t"
            "movw %ax, %fs\n\t"
            "movw %ax, %gs\n\t"

            "pushl %esp\n\t" "call universal_fault_handler\n\t"
            "addl $4, %esp\n\t"
            "popl %gs\n\t"
            "popl %fs\n\t"
            "popl %es\n\t"
            "popl %ds\n\t"
            "popa\n\t"

            "addl $8, %esp\n\t"

            "iret"
            );
}

extern "C" void isr0() { asm volatile ( "pushl $0\n\t" "pushl $" "0" "\n\t" "jmp isr_common" ); }
extern "C" void isr1() { asm volatile ( "pushl $0\n\t" "pushl $" "1" "\n\t" "jmp isr_common" ); }
extern "C" void isr2() { asm volatile ( "pushl $0\n\t" "pushl $" "2" "\n\t" "jmp isr_common" ); }
extern "C" void isr3() { asm volatile ( "pushl $0\n\t" "pushl $" "3" "\n\t" "jmp isr_common" ); }
extern "C" void isr4() { asm volatile ( "pushl $0\n\t" "pushl $" "4" "\n\t" "jmp isr_common" ); }
extern "C" void isr5() { asm volatile ( "pushl $0\n\t" "pushl $" "5" "\n\t" "jmp isr_common" ); }
extern "C" void isr6() { asm volatile ( "pushl $0\n\t" "pushl $" "6" "\n\t" "jmp isr_common" ); }
extern "C" void isr7() { asm volatile ( "pushl $0\n\t" "pushl $" "7" "\n\t" "jmp isr_common" ); }
extern "C" void isr9() { asm volatile ( "pushl $0\n\t" "pushl $" "9" "\n\t" "jmp isr_common" ); }
extern "C" void isr15() { asm volatile ( "pushl $0\n\t" "pushl $" "15" "\n\t" "jmp isr_common" ); }
extern "C" void isr16() { asm volatile ( "pushl $0\n\t" "pushl $" "16" "\n\t" "jmp isr_common" ); }
extern "C" void isr18() { asm volatile ( "pushl $0\n\t" "pushl $" "18" "\n\t" "jmp isr_common" ); }
extern "C" void isr19() { asm volatile ( "pushl $0\n\t" "pushl $" "19" "\n\t" "jmp isr_common" ); }
extern "C" void isr20() { asm volatile ( "pushl $0\n\t" "pushl $" "20" "\n\t" "jmp isr_common" ); }
extern "C" void isr21() { asm volatile ( "pushl $0\n\t" "pushl $" "21" "\n\t" "jmp isr_common" ); }
extern "C" void isr22() { asm volatile ( "pushl $0\n\t" "pushl $" "22" "\n\t" "jmp isr_common" ); }
extern "C" void isr23() { asm volatile ( "pushl $0\n\t" "pushl $" "23" "\n\t" "jmp isr_common" ); }
extern "C" void isr24() { asm volatile ( "pushl $0\n\t" "pushl $" "24" "\n\t" "jmp isr_common" ); }
extern "C" void isr25() { asm volatile ( "pushl $0\n\t" "pushl $" "25" "\n\t" "jmp isr_common" ); }
extern "C" void isr26() { asm volatile ( "pushl $0\n\t" "pushl $" "26" "\n\t" "jmp isr_common" ); }
extern "C" void isr27() { asm volatile ( "pushl $0\n\t" "pushl $" "27" "\n\t" "jmp isr_common" ); }
extern "C" void isr28() { asm volatile ( "pushl $0\n\t" "pushl $" "28" "\n\t" "jmp isr_common" ); }
extern "C" void isr29() { asm volatile ( "pushl $0\n\t" "pushl $" "29" "\n\t" "jmp isr_common" ); }
extern "C" void isr30() { asm volatile ( "pushl $0\n\t" "pushl $" "30" "\n\t" "jmp isr_common" ); }
extern "C" void isr31() { asm volatile ( "pushl $0\n\t" "pushl $" "31" "\n\t" "jmp isr_common" ); }

extern "C" void isr8() { asm volatile ( "pushl $" "8" "\n\t" "jmp isr_common" ); }
extern "C" void isr10() { asm volatile ( "pushl $" "10" "\n\t" "jmp isr_common" ); }
extern "C" void isr11() { asm volatile ( "pushl $" "11" "\n\t" "jmp isr_common" ); }
extern "C" void isr12() { asm volatile ( "pushl $" "12" "\n\t" "jmp isr_common" ); }
extern "C" void isr13() { asm volatile ( "pushl $" "13" "\n\t" "jmp isr_common" ); }
extern "C" void isr14() { asm volatile ( "pushl $" "14" "\n\t" "jmp isr_common" ); }
extern "C" void isr17() { asm volatile ( "pushl $" "17" "\n\t" "jmp isr_common" ); }
# 5 "os/kernel/cpu/exceptions/idt.cpp" 2


struct idt_entry_t {
    uint16_t base_low;
    uint16_t selector;
    uint8_t zero;
    uint8_t flags;
    uint16_t base_high;
} __attribute__((packed));

struct idt_ptr_t {
    uint16_t limit;
    uint32_t base;
} __attribute__((packed));

idt_entry_t idt[256];
idt_ptr_t idtp;

void idt_set_gate(uint8_t num, uint32_t base, uint16_t sel, uint8_t flags) {
    idt[num].base_low = base & 0xFFFF;
    idt[num].base_high = (base >> 16) & 0xFFFF;
    idt[num].selector = sel;
    idt[num].zero = 0;
    idt[num].flags = flags;
}

void register_interrupt_handler(uint8_t n, isr_t handler) {
    exception::interrupt_handlers[n] = handler;
}




void init_idt() {
    idtp.limit = (sizeof(idt_entry_t) * 256) - 1;
    idtp.base = (uint32_t) &idt;

    for (int i = 0; i < 256; i++) {
        idt_set_gate(i, 0, 0, 0);
    }

    idt_set_gate(0, (uint32_t)isr0, 0x08, 0x8E);
    idt_set_gate(1, (uint32_t)isr1, 0x08, 0x8E);
    idt_set_gate(2, (uint32_t)isr2, 0x08, 0x8E);
    idt_set_gate(3, (uint32_t)isr3, 0x08, 0x8E);
    idt_set_gate(4, (uint32_t)isr4, 0x08, 0x8E);
    idt_set_gate(5, (uint32_t)isr5, 0x08, 0x8E);
    idt_set_gate(6, (uint32_t)isr6, 0x08, 0x8E);
    idt_set_gate(7, (uint32_t)isr7, 0x08, 0x8E);
    idt_set_gate(8, (uint32_t)isr8, 0x08, 0x8E);
    idt_set_gate(9, (uint32_t)isr9, 0x08, 0x8E);
    idt_set_gate(10, (uint32_t)isr10, 0x08, 0x8E);;
    idt_set_gate(11, (uint32_t)isr11, 0x08, 0x8E);;
    idt_set_gate(12, (uint32_t)isr12, 0x08, 0x8E);;
    idt_set_gate(13, (uint32_t)isr13, 0x08, 0x8E);;
    idt_set_gate(14, (uint32_t)isr14, 0x08, 0x8E);;
    idt_set_gate(15, (uint32_t)isr15, 0x08, 0x8E);;
    idt_set_gate(16, (uint32_t)isr16, 0x08, 0x8E);;
    idt_set_gate(17, (uint32_t)isr17, 0x08, 0x8E);;
    idt_set_gate(18, (uint32_t)isr18, 0x08, 0x8E);;
    idt_set_gate(19, (uint32_t)isr19, 0x08, 0x8E);;
    idt_set_gate(20, (uint32_t)isr20, 0x08, 0x8E);;
    idt_set_gate(21, (uint32_t)isr21, 0x08, 0x8E);;
    idt_set_gate(22, (uint32_t)isr22, 0x08, 0x8E);;
    idt_set_gate(23, (uint32_t)isr23, 0x08, 0x8E);;
    idt_set_gate(24, (uint32_t)isr24, 0x08, 0x8E);;
    idt_set_gate(25, (uint32_t)isr25, 0x08, 0x8E);;
    idt_set_gate(26, (uint32_t)isr26, 0x08, 0x8E);;
    idt_set_gate(27, (uint32_t)isr27, 0x08, 0x8E);;
    idt_set_gate(28, (uint32_t)isr28, 0x08, 0x8E);;
    idt_set_gate(29, (uint32_t)isr29, 0x08, 0x8E);;
    idt_set_gate(30, (uint32_t)isr30, 0x08, 0x8E);;
    idt_set_gate(31, (uint32_t)isr31, 0x08, 0x8E);;

    for (int i = 0; i < 32; i++) {
        register_interrupt_handler(i, fault_handler);
    }

    asm volatile("lidt %0" : : "m" (idtp));
}
# 82 "os/kernel/cpu/exceptions/exceptions.cpp" 2
# 8 "os/kernel/cpu/cpu.cpp" 2
# 13 "os/kernel/kernel.cpp" 2

# 1 "os/kernel/cmd/cmd.cpp" 1
       


# 1 "os/kernel/cmd/basic.cpp" 1
       




void reboot(char **) {
    outb(0x64, 0xFE);
    outb(0xCF9, 0x0E);

    asm volatile("int $0xFF");
    asm volatile("hlt");
}

void shutdown(char **) {
    auto *acpi_addr = (uint16_t *) 0x40E;
    auto *acpi_enable = (uint8_t *) 0x404;

    outb(*acpi_addr, *acpi_enable);
    for (volatile int i = 0; i < 100000; i++);

    outw(0x604, 0x2000);
    outw(0xB004, 0x2000);
    outw(0x4004, 0x3400);
    outw(0x5304, 0);
    outw(0x5301, 0);
    outw(0x5308, 1);
    outw(0x530E, 0);
    outw(0x530F, 1);
    outw(0x5307, 3);
    outb(*acpi_addr, 0x2000);

}
# 5 "os/kernel/cmd/cmd.cpp" 2


void parse_cmd(const char *s, char **argv, int max_args) {
    if (s == 0 || argv == 0 || max_args <= 0) {
        return;
    }

    for (int i = 0; i < max_args; i++) {
        argv[i] = 0;
    }

    int arg_count = 0;
    const char *start = s;
    bool in_quotes = false;

    while (*s != '\0' && arg_count < max_args - 1) {
        while (*s == ' ' && !in_quotes) {
            s++;
            start = s;
        }

        if (*s == '\0') break;

        if (*s == '"') {
            in_quotes = !in_quotes;
            start = s + 1;
            s++;
            continue;
        }

        if ((*s == ' ' && !in_quotes) || *(s + 1) == '\0') {
            const char *end = s;

            if (*(s + 1) == '\0' && *s != ' ') {
                end = s + 1;
            }

            if (end > start) {
                int length = end - start;
                argv[arg_count] = (char *) allocate(length + 1);

                for (int i = 0; i < length; i++) {
                    argv[arg_count][i] = start[i];
                }
                argv[arg_count][length] = '\0';
                arg_count++;
            }

            start = s + 1;
        }

        s++;
    }

    argv[arg_count] = 0;
}

struct command {
    char *name;

    void (*func)(char **);
};

struct cmd {
    static command commands[32];
    static int command_count;

    static void init() {
        for (int i = 0; i < 32; i++) {
            commands[i].name = 0;
            commands[i].func = 0;
        }
        command_count = 0;

        add_command("reboot", reboot);
        add_command("shutdown", shutdown);
        add_command("help", help);
    }

    static void add_command(const char *name, void (*func)(char **)) {
        if (command_count >= 32) return;

        commands[command_count].name = (char *) name;
        commands[command_count].func = func;
        command_count++;
    }

    static void execute(char *s, Console console) {

        if (s == 0 || s[0] == '\0') {
            return;
        }

        char *argv[32];
        parse_cmd(s, argv, 32);

        if (argv[0] == 0) {
            return;
        }

        for (int i = 0; i < command_count; i++) {
            if (commands[i].name != 0 && commands[i].func != 0) {
                const char *cmd_name = commands[i].name;
                const char *arg_name = argv[0];
                console.write("COMMAND: ");
                console.writeLine(cmd_name);
                console.write("ARG: ");
                console.writeLine(arg_name);

                bool match = true;
                for (int j = 0; cmd_name[j] != '\0' || arg_name[j] != '\0'; j++) {
                    if (cmd_name[j] != arg_name[j]) {
                        match = false;
                        break;
                    }
                }

                if (match) {
                    commands[i].func(argv);
                    return;
                }
            }
        }

        console.write("Command not found: ");
        console.writeLine(argv[0]);
        console.writeLine("Type 'help' for available commands");
    }

private:
    static void help(char **argv) {
        Console console;
        console.writeLine("Available commands:");

        for (int i = 0; i < command_count; i++) {
            if (commands[i].name != 0) {
                console.write("  ");
                console.writeLine(commands[i].name);
            }
        }

        console.writeLine("");
        console.writeLine("Use 'help <command>' for more information");
    }
};

command cmd::commands[32];
int cmd::command_count = 0;
# 15 "os/kernel/kernel.cpp" 2
# 1 "os/kernel/autotest/autotest.cpp" 1
       

# 1 "os/kernel/autotest/memtest.cpp" 1
       




# 1 "os/kernel/autotest/restype.cpp" 1
       

struct TestResult {
    bool passed;
    const char *test_name;
};
# 7 "os/kernel/autotest/memtest.cpp" 2


int memtest(TestResult *results) {
    int test_count = 0;


    results[test_count].test_name = "Basic allocation";
    auto t1 = allocate(64);
    results[test_count++].passed = t1 != nullptr;
    free(t1);

    results[test_count].test_name = "Multiple unique blocks";
    auto t2 = allocate(64);
    auto t3 = allocate(64);
    results[test_count++].passed = allocate(32) != allocate(32);
    free(t2);
    free(t3);

    results[test_count].test_name = "Zero size returns null";
    auto t4 = allocate(0);
    results[test_count++].passed = t4 == nullptr;
    free(t4);

    results[test_count].test_name = "Memory reuse";
    auto t5 = allocate(64);
    free(t5);
    auto t6 = allocate(64);
    results[test_count++].passed = t5 == t6;
    free(t6);

    results[test_count].test_name = "memcpy basic function";
    auto t7 = (char *) allocate(64);
    auto t8 = (char *) nullptr;
    memcpy(t7, t8, 64);
    bool cmp = true;
    for (int i = 0; i < 64; i++) {
        cmp = cmp && t7[i] == t8[i];
    }
    results[test_count++].passed = cmp;
    free(t7);

    results[test_count].test_name = "memcmp basic function";
    auto t9 = allocate(64);
    auto t10 = t9;
    results[test_count++].passed = !memcmp(t9, t10, 64) && !memcmp(t9, nullptr, 64);
    free(t9);

    results[test_count].test_name = "Different sizes work";
    auto t11 = allocate(1);
    auto t12 = allocate(512);
    auto t13 = allocate(2048);
    results[test_count++].passed = t11 && t12 && t13;
    free(t11);
    free(t12);
    free(t13);

    results[test_count].test_name = "memcpy data integrity";
    auto t15 = (char *) allocate(32);
    auto t16 = (char *) allocate(32);
    for (int i = 0; i < 32; i++) t15[i] = i;
    memcpy(t16, t15, 32);
    bool copy_ok = true;
    for (int i = 0; i < 32; i++) copy_ok = copy_ok && (t16[i] == i);
    results[test_count++].passed = copy_ok;
    free(t15);
    free(t16);

    results[test_count].test_name = "realloc enlarge with data preservation";
    auto t17 = (char *) allocate(32);
    memset(t17, 0xA, 32);
    auto t18 = (char *) realloc(t17, 64);
    bool realloc_enlarge_ok = (t18 != nullptr) && (t18[0] == 0xA) && (t18[31] == 0xA);
    results[test_count++].passed = realloc_enlarge_ok;
    if (t18) free(t18);

    results[test_count].test_name = "realloc shrink with data preservation";
    auto t19 = (char *) allocate(64);
    memset(t19, 0xB, 64);
    auto t20 = (char *) realloc(t19, 32);
    bool realloc_shrink_ok = (t20 != nullptr) && (t20[0] == 0xB) && (t20[15] == 0xB);
    results[test_count++].passed = realloc_shrink_ok;
    if (t20) free(t20);

    results[test_count].test_name = "memchr finds byte";
    auto t21 = (char *) allocate(50);
    memset(t21, 'A', 50);
    t21[25] = 'X';
    results[test_count++].passed = memchr(t21, 'X', 50) == t21 + 25;
    free(t21);

    results[test_count].test_name = "memchr not found";
    auto t22 = (char *) allocate(50);
    memset(t22, 'A', 50);
    results[test_count++].passed = memchr(t22, 'B', 50) == nullptr;
    free(t22);

    results[test_count].test_name = "memmove overlap right";
    auto t23 = (char *) allocate(50);
    for (int i = 0; i < 50; i++) t23[i] = i;
    memmove(t23 + 10, t23, 20);
    bool move_ok = true;
    for (int i = 0; i < 20; i++) move_ok = move_ok && (t23[10 + i] == i);
    results[test_count++].passed = move_ok;
    free(t23);

    results[test_count].test_name = "memset patterns";
    auto t24 = (char *) allocate(32);
    memset(t24, 0x55, 32);
    bool set_ok = true;
    for (int i = 0; i < 32; i++) set_ok = set_ok && (t24[i] == 0x55);
    results[test_count++].passed = set_ok;
    free(t24);

    results[test_count].test_name = "calloc zeros memory";
    auto t25 = (int *) calloc(10, sizeof(int));
    bool zero_ok = true;
    for (int i = 0; i < 10; i++) zero_ok = zero_ok && (t25[i] == 0);
    results[test_count++].passed = zero_ok;
    free(t25);

    results[test_count].test_name = "Double free safety";
    auto t26 = allocate(16);
    free(t26);
    free(t26);
    results[test_count++].passed = true;

    results[test_count].test_name = "Free nullptr safety";
    free(nullptr);
    results[test_count++].passed = true;

    results[test_count].test_name = "Fragmentation handling";
    auto t27 = allocate(32);
    auto t28 = allocate(32);
    auto t29 = allocate(32);
    free(t28);
    auto t30 = allocate(32);
    results[test_count++].passed = t30 != nullptr;
    free(t27);
    free(t29);
    free(t30);

    results[test_count].test_name = "Memory alignment";
    auto t31 = allocate(17);
    results[test_count++].passed = ((uint32_t) t31 & 0xF) == 0;
    free(t31);

    results[test_count].test_name = "Boundary access";
    auto t32 = (char *) allocate(8);
    t32[7] = 0xF;
    results[test_count++].passed = t32[7] == 0xF;
    free(t32);

    return test_count;
}
# 4 "os/kernel/autotest/autotest.cpp" 2
# 1 "os/kernel/autotest/mngtest.cpp" 1
       

# 1 "os/kernel/autotest/../managed/managed.cpp" 1
       





template<typename T>
class managed {
protected:
    T *_data;
    int _size = 0;
    int _capacity = 16;

    bool nullend = false;

    void grow_if_needed() {
        if (_size >= _capacity) {
            _capacity = _capacity ? _capacity * 2 : 16;
            _data = (T *) realloc(_data, _capacity * sizeof(T));
        }
    }

public:

    managed() : _data(nullptr), _size(0), _capacity(0) {}

    explicit managed(int capacity) {
        _capacity = capacity > 0 ? capacity : 16;
        _data = (T *) (calloc(_capacity, sizeof(T)));
        _size = 0;
    }

    managed(const managed<T>& other) {
        _capacity = other._capacity;
        _size = other._size;
        _data = (T *) (calloc(_capacity, sizeof(T)));
        memcpy(_data, other._data, _size * sizeof(T));
    }

    managed(managed<T>&& other) noexcept {
        _data = other._data;
        _size = other._size;
        _capacity = other._capacity;

        other._data = nullptr;
        other._size = 0;
        other._capacity = 0;
    }

    ~managed() {
        free(_data);
    }

    managed<T>& operator=(const managed<T>& other) {
        if (this != &other) {
            free(_data);
            _capacity = other._capacity;
            _size = other._size;
            _data = (T *) (calloc(_capacity, sizeof(T)));
            memcpy(_data, other._data, _size * sizeof(T));
        }
        return *this;
    }

    managed<T>& operator=(managed<T>&& other) noexcept {
        if (this != &other) {
            free(_data);
            _data = other._data;
            _size = other._size;
            _capacity = other._capacity;

            other._data = nullptr;
            other._size = 0;
            other._capacity = 0;
        }
        return *this;
    }

    void push_back(const T& value) {
        insert(_size, value);

    }

    void push_back(T&& value) {
        insert(_size, value);
    }

    void insert(int index, const T& value) {
        if (index < 0 || index > _size) panic("Index out of range");

        grow_if_needed();

        for (int i = _size; i > index; i--) {
            _data[i] = _data[i - 1];
        }
        _data[index] = value;
        _size++;
    }

    void remove(int index) {
        if (index < 0 || index >= _size) panic("Index out of range");

        for (int i = index; i < _size - 1; i++) {
            _data[i] = _data[i + 1];
        }
        _size--;
    }

    T &operator[](int index) {
        if (index < 0 || index >= _size) panic("Index out of range");
        return _data[index];
    }

    const T &operator[](int index) const {
        if (index < 0 || index >= _size) panic("Index out of range");
        return _data[index];
    }

    managed<T> operator+(const T& value) const {
        managed res(*this);
        res.push_back(value);
        return res;
    }

    managed<T> operator+(const managed<T>& other) const {
        managed<T> res;
        res._capacity = _size + other._size;
        res._data = (T *) (calloc(res._capacity, sizeof(T)));

        if (_size > 0) {
            memcpy(res._data, _data, _size * sizeof(T));
        }
        if (other._size > 0) {
            memcpy(res._data + _size, other._data, other._size * sizeof(T));
        }

        res._size = _size + other._size;
        return res;
    }

    managed<T>& operator+=(const T& value) {
        push_back(value);
        return *this;
    }

    managed<T>& operator+=(const T&& value) {
        push_back(value);
        return *this;
    }

    managed<T>& operator+=(const managed<T>& other) {
        int old_size = _size;
        _size += other._size;

        if (_size > _capacity) {
            _capacity = _size;
            _data = (T *) realloc(_data, _capacity * sizeof(T));
        }

        if (other._size > 0) {
            memcpy(_data + old_size, other._data, other._size * sizeof(T));
        }

        return *this;
    }

    bool operator==(const managed<T>& other) const {
        if (_size != other._size) return false;
        for (int i = 0; i < _size; i++) {
            if (_data[i] != other._data[i]) return false;
        }
        return true;
    }

    bool operator!=(const managed<T>& other) const {
#pragma clang diagnostic push
#pragma ide diagnostic ignored "Simplify"
        return !(*this == other);
#pragma clang diagnostic pop
    }

    T *data() {
        return _data;
    }

    const T *data() const {
        return _data;
    }

    int size() const {
        return _size;
    }

    int capacity() const {
        return _capacity;
    }

    bool empty() const {
        return _size == 0;
    }

    void clear() {
        _size = 0;
    }

    void reserve(int new_capacity) {
        if (new_capacity > _capacity) {
            _capacity = new_capacity;
            _data = (T *) realloc(_data, _capacity * sizeof(T));
        }
    }

    void shrink_to_fit() {
        if (_size < _capacity) {
            _capacity = _size > 0 ? _size : 1;
            _data = (T *) realloc(_data, _capacity * sizeof(T));
        }
    }
# 229 "os/kernel/autotest/../managed/managed.cpp"
    template<size_t N>
    managed(const T (&array)[N]) {
        _capacity = N > 0 ? N : 16;
        _data = (T *)calloc(_capacity, sizeof(T));
        _size = 0;
        for (size_t i = 0; i < N; i++) {
            push_back(array[i]);
        }
    }

    template<size_t N>
    managed<T>& operator+=(const T (&array)[N]) {
        for (size_t i = 0; i < (nullend ? (N-1) : N); i++) {
            push_back(array[i]);
        }
        return *this;
    }

    template<size_t N>
    managed<T> operator+(const T (&array)[N]) const {
        managed<T> res(*this);
        for (size_t i = 0; i < (nullend ? (N-1) : N); i++) {
            res.push_back(array[i]);
        }
        return res;
    }
};

# 1 "os/kernel/autotest/../managed/string.cpp" 1
       



struct string : public managed<char> {
    string(const char *s) : managed<char>() {
        nullend = true;

        while (*s != 0) push_back(*(s++));
    }
};
# 258 "os/kernel/autotest/../managed/managed.cpp" 2
# 4 "os/kernel/autotest/mngtest.cpp" 2




int mngtest(TestResult *results) {
    int test_count = 0;

    results[test_count].test_name = "Basic int creation and push_back";
    managed<int> int_arr;
    int_arr.push_back(42);
    int_arr.push_back(123);
    results[test_count++].passed = int_arr[0] == 42 && int_arr[1] == 123 && int_arr.size() == 2;

    results[test_count].test_name = "Char insertion at position";
    managed<char> char_arr;
    char_arr.push_back('A');
    char_arr.push_back('C');
    char_arr.insert(1, 'B');
    results[test_count++].passed =
            char_arr[0] == 'A' && char_arr[1] == 'B' && char_arr[2] == 'C' && char_arr.size() == 3;

    results[test_count].test_name = "Double element removal";
    managed<double> double_arr;
    double_arr.push_back(1.1);
    double_arr.push_back(2.2);
    double_arr.push_back(3.3);
    double_arr.remove(1);
    results[test_count++].passed = double_arr[0] == 1.1 && double_arr[1] == 3.3 && double_arr.size() == 2;

    results[test_count].test_name = "Int array subscript operator";
    managed<int> int_arr2;
    int_arr2.push_back(10);
    int_arr2.push_back(20);
    int_arr2[0] = 100;
    int_arr2[1] = 200;
    results[test_count++].passed = int_arr2[0] == 100 && int_arr2[1] == 200;

    results[test_count].test_name = "Float operator+ with single element";
    managed<float> float_arr1;
    float_arr1.push_back(1.5f);
    managed<float> float_arr2 = float_arr1 + 2.5f;
    results[test_count++].passed = float_arr2.size() == 2 && float_arr2[0] == 1.5f && float_arr2[1] == 2.5f;

    results[test_count].test_name = "Int operator+ with another managed";
    managed<int> arr1;
    arr1.push_back(1);
    arr1.push_back(2);
    managed<int> arr2;
    arr2.push_back(3);
    arr2.push_back(4);
    managed<int> arr3 = arr1 + arr2;
    results[test_count++].passed = arr3.size() == 4 && arr3[0] == 1 && arr3[1] == 2 && arr3[2] == 3 && arr3[3] == 4;

    results[test_count].test_name = "Char operator+= with element";
    managed<char> char_arr2;
    char_arr2 += 'X';
    char_arr2 += 'Y';
    results[test_count++].passed = char_arr2.size() == 2 && char_arr2[0] == 'X' && char_arr2[1] == 'Y';

    results[test_count].test_name = "Double operator+= with another managed";
    managed<double> dbl_arr1;
    dbl_arr1.push_back(1.0);
    managed<double> dbl_arr2;
    dbl_arr2.push_back(2.0);
    dbl_arr1 += dbl_arr2;
    results[test_count++].passed = dbl_arr1.size() == 2 && dbl_arr1[0] == 1.0 && dbl_arr1[1] == 2.0;

    results[test_count].test_name = "Int capacity auto-expansion";
    managed<int> expand_arr(2);
    expand_arr.push_back(1);
    expand_arr.push_back(2);
    expand_arr.push_back(3);
    results[test_count++].passed = expand_arr.size() == 3 && expand_arr.capacity() > 2;

    results[test_count].test_name = "Float data() method returns correct pointer";
    managed<float> data_arr;
    data_arr.push_back(1.1f);
    data_arr.push_back(2.2f);
    float *data_ptr = data_arr.data();
    results[test_count++].passed = data_ptr[0] == 1.1f && data_ptr[1] == 2.2f;

    results[test_count].test_name = "Destructor safety";
    {
        managed<int> temp_arr;
        temp_arr.push_back(1);
        temp_arr.push_back(2);
    }
    managed<int> new_arr;
    new_arr.push_back(3);
    results[test_count++].passed = new_arr[0] == 3;

    results[test_count].test_name = "Out of bounds access safety";
    managed<int> bounds_arr;
    bounds_arr.push_back(1);

    results[test_count++].passed = true;
    results[test_count].test_name = "Large number of elements (stress test)";
    managed<int> stress_arr;
    bool stress_ok = true;
    for (int i = 0; i < 100; i++) {
        stress_arr.push_back(i);
        if (stress_arr[i] != i) {
            stress_ok = false;
            break;
        }
    }
    results[test_count++].passed = stress_ok && stress_arr.size() == 100;

    results[test_count].test_name = "Multiple type instances coexistence";
    managed<int> multi_int;
    managed<char> multi_char;
    managed<double> multi_double;

    multi_int.push_back(100);
    multi_char.push_back('Z');
    multi_double.push_back(3.14159);

    results[test_count++].passed = multi_int[0] == 100 && multi_char[0] == 'Z' &&
                                   multi_double[0] == 3.14159;

    results[test_count].test_name = "Initial capacity and size";
    managed<int> init_arr(32);
    results[test_count++].passed = init_arr.size() == 0 && init_arr.capacity() == 32;

    return test_count;

}
# 5 "os/kernel/autotest/autotest.cpp" 2



void check(TestResult *resbuf, unsigned short *cbuf, Console console, int count) {
    bool score = true;

    int passed_count = 0;
    for (int i = 0; i < count; ++i) {
        if (resbuf[i].passed) {

            passed_count++;
        }
        if (!resbuf[i].passed) {
            console.write(resbuf[i].passed ? "[----] " : "[FAIL] ");
            console.writeLine(resbuf[i].test_name);
            score = false;
        }
    }

    if (!score) {
        memcpy((void *) 0xB8000, cbuf, 4000);

        panic("");
    }
}

void autotest() {
    unsigned short cbuf[4000];
    Console console = Console(cbuf);
    console.writeLine("KERNEL PANIC\n");
    console.writeLine("AUTOTEST FAILED");
    TestResult resbuf[20] = {};

    console.writeLine("MEMORY TEST");

    check(resbuf, cbuf, console, memtest(resbuf));
    check(resbuf, cbuf, console, mngtest(resbuf));


}
# 16 "os/kernel/kernel.cpp" 2


extern "C" void _start() {
    exception::init();
    memory::init();
    autotest();

    Console console = Console();
    console.clear();

    string a = "Hello,";
    a += " world";
    a += '!';
    console.write(a.data());
}
