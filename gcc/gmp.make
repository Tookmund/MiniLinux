PROGVER=6.1.2
PROG=gmp
PROGCOMP=xz
PROGURL=http://ftp.gnu.org/gnu/gmp/
PROGSIG=sig

all: $(PROG)-dep

include ../prog.make
