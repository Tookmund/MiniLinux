PROGVER=1.1.22
PROG=musl
PROGCOMP=gz
PROGURL=https://www.musl-libc.org/releases/
PROGSIG=asc

include ../prog.makefile

include ../tools.makefile

build: $(PROG)
	cd $(PROG) && \
		./configure --prefix=$$PREFIX/$$TRIPLE --with-sysroot=no  \
		--enable-debug --enable-optimize \
		CROSS_COMPILE="$$TRIPLE-" CC="$$TRIPLE-gcc" && \
		make && \
		make install

clean: $(PROG)-clean

