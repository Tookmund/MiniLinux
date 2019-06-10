MUSLVER=1.1.22
MUSL=musl-$(MUSLVER)
MUSLTAR=$(MUSL).tar.gz
MUSLURL=https://www.musl-libc.org/releases/$(MUSLTAR)

include ../tools.makefile

build: $(MUSL)
	cd $(MUSL) && \
		./configure --prefix=$(TOOLSPREFIX) --syslibdir=$(TOOLSPREFIX)/lib && \
		make && \
		make install

$(MUSL): $(MUSLTAR)
	tar xavf $(MUSLTAR)
	touch $(MUSL)

$(MUSLTAR): $(MUSLTAR).asc
	wget $(MUSLURL)
	touch $(MUSLTAR)
	gpg --verify $(MUSLTAR).asc

$(MUSLTAR).asc:
	wget $(MUSLURL).asc
	touch $(MUSLTAR).asc

clean:
	rm -f $(MUSLTAR)*
	rm -rf $(MUSL)
