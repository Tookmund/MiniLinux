PROGVER=8.2.0
PROG=gcc
PROGCOMP=xz
PROGURL=http://ftp.gnu.org/gnu/gcc/$(PROGFULL)/
PROGSIG=sig

extract: gcc-build

include ../prog.make

pass1: extract
	export CFLAGS="-O0 -g0"
	export CXXFLAGS="-O0 -g0"
	cd $(PROGFULL) && \
		rm -rf pass1 && \
		mkdir pass1 && \
		cd pass1 && \
		../configure --prefix=$$PREFIX --target=$$TRIPLE --with-sysroot=no \
    --enable-languages=c --with-newlib --disable-libssp --disable-nls \
    --disable-libquadmath --disable-threads --disable-decimal-float \
--disable-shared --disable-libmudflap --disable-libgomp --disable-libatomic \
--disable-lto-plugin

gcc-build: $(PROGFULL) deps
	mv gmp mpc mpfr $(PROGFULL)

deps:
	for i in *.make; \
		do \
		make -f $$i; \
		done

dep-clean:
	for i in *.make; \
		do \
		make -f $$i clean; \
		done
