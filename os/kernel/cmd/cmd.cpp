#pragma once

#include "../memory/memory.cpp"
#include "basic.cpp"
#include "../console.cpp"

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