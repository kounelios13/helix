CC=gcc
CFLAGS=-std=c99 -Wall -Wextra -Wundef -Wfloat-equal -Wpointer-arith -Wcast-align -Wstrict-prototypes -Wno-missing-field-initializers -Warray-bounds -pedantic -fstrict-aliasing
LINKS=-lpcre
INCLUDES=-Isrc

LIB_OBJS =
LIB_OBJS += build/objs/constructs.o
LIB_OBJS += build/objs/core.o
LIB_OBJS += build/objs/error.o
LIB_OBJS += build/objs/helix.o
LIB_OBJS += build/objs/lexer.o
LIB_OBJS += build/objs/tpv/slre.o

EXEC=helix

all: $(EXEC)
	@echo "execution begin---->"

$(EXEC): $(LIB_OBJS)
	@$(CC) $(CFLAGS) -o $@ $(LIB_OBJS) $(INCLUDES) $(LINKS)

$(LIB_OBJS): build/objs/%.o: src/%.c
	@echo "cc: $<"
	@$(CC) $(CFLAGS) -c $< $(INCLUDES) $(LINKS) -o $@

clean:
	find . -type f -name '*.o' -delete

install:
	sudo cp helix /usr/local/bin
