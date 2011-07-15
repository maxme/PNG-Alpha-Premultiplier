##
## http://twitter.com/maximeb
##

include configure.mk

CC				= gcc
SOURCES_C		= $(shell find . -name "*.c")
OBJS			= $(SOURCES_C:.c=.o)
EXEC			= NPMApng2PMApng
CFLAGS			= -W -Wall -ggdb -DNDEBUG $(CONF_INCS)
LIBS			= $(CONF_LIBS) -lpng

all: $(EXEC)

$(EXEC): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) $(LIBS) -o $(EXEC)

%.o: %.c %.h
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -f $(OBJS) *~ \#*

distclean: clean
	rm -f $(EXEC)
