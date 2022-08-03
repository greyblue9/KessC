CC ?= gcc
CFILES = $(wildcard src/*.c)
CFLAGS ?= -Werror=implicit     \
	-Werror=implicit-function-declaration  \
	-Werror=implicit-int \
	-Werror=int-conversion \
	-Werror=incompatible-pointer-types \
	-Werror=int-to-pointer-cast        \
	-fsanitize=address

OBJS = $(SOURCES:%.c=%.o)
SOURCES = $(shell find $(PWD) -name "*.c")

.PHONY: all

all: bin/kesscc

bin/kesscc: $(OBJS)
	@mkdir -p bin

%.o: %.c
	$(CC) $(CFLAGS) -Iinclude -c -o $@ $^

.PHONY: install
install: bin/kesscc
	sudo install bin/kesscc /usr/local/bin/kesscc