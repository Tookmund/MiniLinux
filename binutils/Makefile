BINVER=2.32
BIN=binutils-$(BINVER)
BINTAR=$(BIN).tar.xz
BINURL=http://ftpmirror.gnu.org/binutils/$(BINTAR)

$(BIN): $(BINTAR)
	tar xavf $(BINTAR)
	touch $(BIN)

$(BINTAR): $(BINTAR).sig
	wget $(BINURL)
	gpg --verify $(BINTAR).sig
	touch $(BINTAR)

$(BINTAR).sig:
	wget $(BINURL).sig
	touch $(BINTAR).sig

clean:
	rm -f $(BINTAR)*
	rm -rf $(BIN)
