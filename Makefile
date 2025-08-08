# Compiler and flags
CC = gcc
CFLAGS = -O3 -maes -msse2 -mvaes -mavx512vl -Wall -Wextra
LDFLAGS =

# Source and output
SRC = sm4.c
OBJ = $(SRC:.c=.o)
EXEC = sm4

# Default target
all: $(EXEC)

# Link object files
$(EXEC): $(OBJ)
	$(CC) $(OBJ) -o $@ $(LDFLAGS)

# Compile source files
%.o: %.c sm4.h
	$(CC) $(CFLAGS) -c $< -o $@

# Clean up
clean:
	del /F /Q $(OBJ) $(EXEC).exe 2>nul || exit 0

# Phony targets
.PHONY: all clean