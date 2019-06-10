PROGVER=8.2.0
PROG=gcc
PROGCOMP=xz
PROGURL=http://ftp.gnu.org/gnu/gcc/$(PROGFULL)/
PROGSIG=sig

extract: gcc-build

include ../prog.make

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
