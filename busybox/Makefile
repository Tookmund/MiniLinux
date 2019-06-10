BBVER=1.30.1
BBTAR=busybox-$(BBVER).tar.bz2
BBURL=https://busybox.net/downloads/$(BBTAR)

busybox: $(BBTAR)


$(BBTAR): $(BBTAR).sig $(BBTAR).sha256
	wget $(BBURL)
	gpg --verify $(BBTAR).sig
	sha256sum -c $(BBTAR).sha256

$(BBTAR).sig:
	wget $(BBURL).sig

$(BBTAR).sha256:
	wget $(BBURL).sha256

clean:
	rm -f $(BBTAR) $(BBTAR).sig $(BBTAR).sha256
