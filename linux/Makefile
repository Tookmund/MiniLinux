LINVER=linux-4.19.49
LINTAR=$(LINVER).tar
LINURL=https://cdn.kernel.org/pub/linux/kernel/v4.x/$(LINTAR)

$(LINVER): $(LINTAR)
	tar xvf $(LINTAR)
	touch $(LINVER)

$(LINTAR): $(LINTAR).xz $(LINTAR).sign
	unxz -k $(LINTAR).xz
	gpg --verify $(LINTAR).sign
	touch $(LINTAR)

$(LINTAR).xz:
	wget $(LINURL).xz
	touch $(LINTAR).xz

$(LINVER).tar.sign:
	wget $(LINURL).sign


clean:
	rm -f $(LINTAR)*
	rm -rf $(LINVER)

$(LINVER)/config: $(LINVER)
	cd $(LINVER) && \
		make defconfig

headers: $(LINVER)/config
	cd $(LINVER) && \
		make headers_install ARCH=$$LINUX_ARCH INSTALL_HDR_PATH="$$PREFIX/$$TRIPLE"
