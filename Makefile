# Compiler and flags
CC = gcc
CFLAGS = -O3 -maes -msse2 -mvaes -mavx512vl -mavx512f -Wall -Wextra -DUSE_AESNI -DUSE_AVX512
LDFLAGS =

# Source and output
SRC = sm4.c
OBJ = $(SRC:.c=.o)
EXEC = sm4.exe

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
	rm -f $(OBJ) $(EXEC)

# Phony targets
.PHONY: all clean