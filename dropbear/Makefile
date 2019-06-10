PROGVER=2019.78
PROG=dropbear
PROGCOMP=bz2
PROGURL=https://matt.ucc.asn.au/dropbear/releases/
PROGSIG=asc

dropbear-build: $(PROG)
	cd $(PROGFULL) && \
		./configure --disable-zlib --enable-static && \
		make && \
		cp dropbear dropbearkey dbclient dropbearconvert ..

include ../prog.makefile

clean: $(PROG)-clean
