#!/bin/sh

set -eux

. helpers/installers/common.sh

BUILD_DEP="wget"

install() {
	pkg_cache_update
	install_build_dep

	install_neovim

	uninstall_build_dep
}

pkg_cache_update() {
	apt update
}

install_build_dep() {
	apt install -y "$BUILD_DEP"
}

uninstall_build_dep() {
	apt remove -y "$BUILD_DEP"
}
