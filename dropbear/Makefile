DBVER=2019.78
DB=dropbear-$(DBVER)
DBTAR=$(DB).tar.bz2
DBURL=https://matt.ucc.asn.au/dropbear/releases/$(DBTAR)

$(DB): $(DBTAR)
	tar xavf $(DBTAR)
	touch $(DB)

$(DBTAR): $(DBTAR).asc
	wget $(DBURL)
	gpg --verify $(DBTAR).asc
	touch $(DBTAR)

$(DBTAR).asc:
	wget $(DBURL).asc
	touch $(DBTAR).asc

clean:
	rm -f $(DBTAR)*
	rm -rf $(DB)
