PROGVER=1.1.22
PROG=musl
PROGCOMP=gz
PROGURL=https://www.musl-libc.org/releases/
PROGSIG=asc

include ../prog.makefile

include ../tools.makefile

build: $(PROG)
	cd $(PROG) && \
		./configure --prefix=$(TOOLSPREFIX) --syslibdir=$(TOOLSPREFIX)/lib && \
		make && \
		make install

clean: $(PROG)-clean
