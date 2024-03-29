FETCH=wget
# PROGVER=
# PROG=
# PROGCOMP
# PROGURL
# PROGSIG

PROGFULL=$(PROG)-$(PROGVER)
PROGTAR=$(PROGFULL).tar.$(PROGCOMP)
PROGLOC=$(PROGURL)/$(PROGTAR)
SIGFILE=$(PROGTAR).$(PROGSIG)

$(PROGFULL): $(PROGTAR)
	tar xavf $(PROGTAR)
	touch $(PROGFULL)

$(PROGTAR): $(SIGFILE)
	$(FETCH) $(PROGLOC)
	touch $(PROGTAR)
	gpg --verify $(SIGFILE)

$(SIGFILE):
	$(FETCH) $(PROGLOC).$(PROGSIG)
	touch $(SIGFILE)

clean:
	rm -f $(PROGTAR)*
	rm -rf $(PROGFULL)

$(PROG)-dep: $(PROGFULL)
	if [ ! -L $(PROG) ]; then \
		ln -s $(PWD)/$(PROGFULL) $(PROG); \
	fi
