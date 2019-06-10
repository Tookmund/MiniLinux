PROGVER=1.1.22
PROG=musl
PROGCOMP=gz
PROGURL=https://www.musl-libc.org/releases/
PROGSIG=asc

include ../prog.make

build: $(PROG)
	cd $(PROG) && \
		./configure --prefix=$$PREFIX \
		--enable-debug --enable-optimize \
		CROSS_COMPILE="$$TRIPLE-" CC="$$TRIPLE-gcc" && \
		make && \
		make install
