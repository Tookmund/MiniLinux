BBVER=1.30.1
BB=busybox-$(BBVER)
BBTAR=$(BB).tar.bz2
BBURL=https://busybox.net/downloads/$(BBTAR)

busybox: $(BB)
	cd busybox-$(BBVER) && \
		make defconfig && \
		make busybox LDFLAGS="--static" && \
		mkdir -p ../bin && \
		cp busybox ../bin
	cd bin && \
		for i in $$(cat ../busybox-list); \
		do \
			ln -s busybox $$i; \
		done

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
