#pragma once

#include "utils/utils.cpp"

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