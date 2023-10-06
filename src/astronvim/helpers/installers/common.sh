#!/bin/sh

set -eux

install() {
	TEMP_DIR="$(mktemp -d)"

	cd "$TEMP_DIR"

	wget "https://github.com/AstroNvim/AstroNvim/archive/refs/tags/$ASTRONVIM_VERSION.tar.gz"
	tar xf "$ASTRONVIM_VERSION.tar.gz"
	rm "$ASTRONVIM_VERSION.tar.gz"

	mkdir -p ~/.config
	ls
	mv "AstroNvim-${ASTRONVIM_VERSION#v}" ~/.config/nvim
}
