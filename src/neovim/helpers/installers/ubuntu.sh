#!/bin/bash

set -eux

BUILD_DEP="wget"
RUNTIME_DEP=""

_APT_CACHE_UPDATED=0

install() {
	OS=$1
	OS_VERSION=$2

	pkg_cache_update
	install_build_dep
	install_neovim
	uninstall_build_dep
	# install_runtime_dep
}

pkg_cache_update() {
	if [ "$_APT_CACHE_UPDATED" -eq 0 ]; then
		apt update
		_APT_CACHE_UPDATED=1
	fi
}

install_build_dep() {
	apt install -y "$BUILD_DEP"
}

uninstall_build_dep() {
	apt remove -y "$BUILD_DEP"
}

install_runtime_dep() {
	apt install -y "$RUNTIME_DEP"
}

install_neovim() {
	TEMP_DIR="$(mktemp -d)"
	cd "$TEMP_DIR"

	wget "https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/nvim-linux64.tar.gz"
	tar xf nvim-linux64.tar.gz
	rm nvim-linux64.tar.gz

	# move the executable
	mv --force nvim-linux64/bin/nvim /usr/local/bin
	ln --symbolic --force /usr/local/bin/nvim /usr/bin/

	# copy share files
	cp --recursive --update --verbose nvim-linux64/share/* /usr/local/share
	rm -rf nvim-linux64/share

	# copy libs
	cp --recursive --update --verbose nvim-linux64/lib/* /usr/local/lib
	rm -rf nvim-linux64/lib

	# copy man pages
	cp --recursive --update --verbose nvim-linux64/man/* /usr/local/man
	rm -rf nvim-linux64/man
}
