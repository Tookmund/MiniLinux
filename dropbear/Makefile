PROGVER=2019.78
PROG=dropbear
PROGCOMP=bz2
PROGURL=https://matt.ucc.asn.au/dropbear/releases/
PROGSIG=asc

include ../tools.make

all: dropbear-build

include ../prog.make

dropbear-build: $(PROGFULL)
	cd $(PROGFULL) && \
		./configure --disable-zlib --enable-static --host=$(HOST) && \
		make && \
		mkdir -p ../bin && \
		cp dropbear dropbearkey dbclient dropbearconvert ../bin

bin-clean:
	rm -rf bin/
