# Makefile per RetroConsole

CC       := gcc
CFLAGS   := -std=c99 -Wall -Wextra -Iinclude
LDFLAGS  := -lSDL2
BUILD    := build
SRC      := $(wildcard src/*.c)
OBJ      := $(patsubst src/%.c,$(BUILD)/%.o,$(SRC))
TARGET   := retroconsole

.PHONY: all clean

all: dirs $(BUILD)/$(TARGET)

dirs:
	@mkdir -p $(BUILD)

$(BUILD)/$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS)

$(BUILD)/%.o: src/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(BUILD)
