PROGVER=4.0.2
PROG=mpfr
PROGCOMP=xz
PROGURL=http://www.mpfr.org/$(PROG)-$(PROGVER)/
PROGSIG=asc

all: $(PROG)-dep

include ../prog.make
