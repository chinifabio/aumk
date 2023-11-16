.PHONY: install uninstall

install:
	install -D automount $(DESTDIR)$(PREFIX)/bin/automount
	install -Dm644 automount.rules $(DESTDIR)$(PREFIX)/lib/udev/rules.d/99-automount.rules
	install -Dm644 automount@.service $(DESTDIR)$(PREFIX)/lib/systemd/system/automount@.service

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/automount
	rm -f $(DESTDIR)$(PREFIX)/lib/udev/rules.d/99-automount.rules
	rm -f $(DESTDIR)$(PREFIX)/lib/systemd/system/automount@.service