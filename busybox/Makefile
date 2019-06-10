BBVER=1.30.1
BB=busybox-$(BBVER)
BBTAR=$(BB).tar.bz2
BBURL=https://busybox.net/downloads/$(BBTAR)

include ../tools.make

busybox: $(BB)
	cd busybox-$(BBVER) && \
		make CROSS_COMPILE=$(HOST)- CONFIG_PREFIX=../bin defconfig && \
		make CROSS_COMPILE=$(HOST)- LDFLAGS="--static" busybox && \
		make CONFIG_PREFIX=../bin install

$(BB): $(BBTAR)
	tar xavf $(BBTAR)
	touch $(BB)

$(BBTAR): $(BBTAR).sig $(BBTAR).sha256
	wget $(BBURL)
	touch $(BBTAR)
	gpg --verify $(BBTAR).sig
	sha256sum -c $(BBTAR).sha256

$(BBTAR).sig:
	wget $(BBURL).sig

$(BBTAR).sha256:
	wget $(BBURL).sha256

clean:
	rm -rf bin/
	rm -f $(BBTAR) $(BBTAR).sig $(BBTAR).sha256
	rm -rf $(BB)
