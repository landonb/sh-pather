PREFIX ?= /usr/local

SHFILES = path_prefix path_suffix pather.sh

install:
	for shfile in ${SHFILES}; do \
		cp -f bin/$${shfile} $(PREFIX)/bin/${shfile}; \
	done

uninstall:
	for shfile in ${SHFILES}; do \
		rm -f $(PREFIX)/bin/$${shfile}; \
	done

