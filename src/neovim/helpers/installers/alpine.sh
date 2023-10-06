#!/bin/sh

set -eux

install() {
	if [ "$NVIM_VERSION" != "v0.9.2" || $NVIM_VERSION != "stable"]; then
		echo "On $OS, the only supported nvim version is v0.9.2" >&2
		echo "But the requested version is $NVIM_VERSION"
		exit 1
	fi

	apk add neovim
}
