LIBCVER=0.9.31
LIBC=uClibc-$(LIBCVER)
LIBCTAR=$(LIBC).tar.xz
LIBCURL=https://www.uclibc.org/downloads/$(LIBCTAR)

$(LIBC): $(LIBCTAR)
	tar xavf $(LIBCTAR)
	touch $(LIBC)

$(LIBCTAR): $(LIBCTAR).sign
	wget $(LIBCURL)
	gpg --verify $(LIBCTAR).sign
	touch $(LIBCTAR)

$(LIBCTAR).sign:
	wget $(LIBCURL).sign
	touch $(LIBCTAR).sign

clean:
	rm -f $(LIBCTAR)*
	rm -rvf $(LIBC)
