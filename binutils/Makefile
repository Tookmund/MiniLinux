PROGVER=2.32
PROG=binutils
PROGCOMP=xz
PROGURL=http://ftpmirror.gnu.org/binutils/
PROGSIG=sig

include ../prog.make

pass1: $(PROGFULL)
	cd $(PROGFULL) && \
		rm -rf pass1 && \
		mkdir pass1 && \
		cd pass1 && \
		../configure --prefix=$$PREFIX --target=$$TRIPLE --disable-werror \
		--with-sysroot=no --enable-deterministic-archives &&\
		make &&\
		make install
