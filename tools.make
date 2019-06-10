TOOLSPREFIX=$(PWD)/../tools
PATH=$(TOOLSPREFIX)/bin:$(PATH)
CC="'"musl-gcc"' -Wl,-Bstatic -static-libgcc"
