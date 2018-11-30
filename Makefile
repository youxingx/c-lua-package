# $Id: Makefile,v 1.36 2009/09/21 17:02:44 mascarenhas Exp $

T= c-lua

CONFIG= ./config

include $(CONFIG)

SRCS= src/$T.c
OBJS= src/$T.o

lib: src/c-lua.so

src/c-lua.so: $(OBJS)
	MACOSX_DEPLOYMENT_TARGET="10.3"; export MACOSX_DEPLOYMENT_TARGET; $(CC) $(LIB_OPTION) -o src/c-lua.so $(OBJS)

test: lib
	LUA_CPATH=./src/?.so

install:
	mkdir -p $(DESTDIR)$(LUA_LIBDIR)
	cp src/c-lua.so $(DESTDIR)$(LUA_LIBDIR)

clean:
	rm -f src/c-lua.so $(OBJS)
