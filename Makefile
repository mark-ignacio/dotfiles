build:
	rm -rf build
	mkdir build
	install -d -m 755 build/etc
	install -D -m 644 tmux.conf build/etc/tmux.conf

NOWISH := $(shell date +%s)

.PHONY: clean
clean:
	rm -rf build
	rm -vf *.rpm *.deb

.PHONY: rpm
rpm: build
	rm -vf *.rpm
	fpm -s dir \
		-t rpm \
		-C build \
		--name dotfiles \
		--version '$(NOWISH)' \
		--maintainer 'Mark Ignacio <mark@ignacio.io>' \
		--depends tmux \
		--config-files /etc/tmux.conf \
		--rpm-use-file-permissions \
		.

.PHONY: deb
deb: build
	rm -vf *.deb
	fpm -s dir \
		-t deb \
		-C build \
		--name dotfiles \
		--version '$(NOWISH)' \
		--maintainer 'Mark Ignacio <mark@ignacio.io>' \
		--depends tmux \
		--config-files /etc/tmux.conf \
		--deb-use-file-permissions \
		.
