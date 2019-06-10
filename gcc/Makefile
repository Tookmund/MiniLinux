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
		../configure --prefix=$$PREFIX --target=$$TRIPLE \
    --enable-languages=c --with-newlib --disable-libssp --disable-nls \
    --disable-libquadmath --disable-threads --disable-decimal-float \
	--disable-shared --disable-libmudflap --disable-libgomp --disable-libatomic \
	--disable-lto-plugin \
	$$GCC_MULTILIB_CONFFLAGS


pass2: extract
	cd $(PROGFULL) && \
		rm -rf pass2 && \
		mkdir pass2 && \
		cd pass2 && \
		../configure --prefix=$$PREFIX --target=$$TRIPLE \
		--enable-languages=c --disable-libmudflap \
		--disable-libsanitizer --disable-nls \
		$$GCC_MULTILIB_CONFFLAGS && \
		make && \
		make install
	# un"fix" headers
	rm -rf "$$PREFIX/lib/gcc/$$TRIPLE"/*/include-fixed/ "$$PREFIX/lib/gcc/$$TRIPLE"/*/include/stddef.h

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
