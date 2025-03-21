TARGET = florixel
CC = gcc
CFLAGS = -Wall -Wextra -std=c99 -Iinclude

SRC_DIR = src
BUILD_DIR = build
BIN_DIR = bin

SRC = $(wildcard $(SRC_DIR)/*.c)
OBJ = $(SRC:$(SRC_DIR)/%.c=$(BUILD_DIR)/%.o)

all: dirs $(BIN_DIR)/$(TARGET)

dirs:
	mkdir -p $(BUILD_DIR) $(BIN_DIR)

$(BIN_DIR)/$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@



clean:
	rm -rf $(BUILD_DIR)/*.o $(BIN_DIR)/$(TARGET)

rebuild: clean all

.PHONY: all clean rebuild dirs
