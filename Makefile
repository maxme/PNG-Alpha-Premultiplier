##
## http://twitter.com/maximeb
##

include configure.mk

CC				= gcc
SOURCES_NPMA	= NPMApng2PMApng.c
SOURCES_AAAA    = RGBA2AAAA.c
OBJS_NPMA		= $(SOURCES_NPMA:.c=.o)
OBJS_AAAA		= $(SOURCES_AAAA:.c=.o)
CFLAGS			= -W -Wall -ggdb -DNDEBUG $(CONF_INCS)
LIBS			= $(CONF_LIBS) -lpng
EXEC			= NPMApng2PMApng RGBA2AAAA

all: $(EXEC)

NPMApng2PMApng: $(OBJS_NPMA)
	$(CC) $(CFLAGS) $(OBJS_NPMA) $(LIBS) -o NPMApng2PMApng

RGBA2AAAA: $(OBJS_AAAA)
	$(CC) $(CFLAGS) $(OBJS_AAAA) $(LIBS) -o RGBA2AAAA

%.o: %.c %.h
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -f $(OBJS) *~ \#*

distclean: clean
	rm -f $(EXEC)
