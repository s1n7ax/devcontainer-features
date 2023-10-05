#!/bin/bash
set -eux

NVIM_VERSION="$VERSION"

if [ -f /etc/os-release ]; then
	. /etc/os-release

	OS="$ID"
	OS_VERSION=$VERSION_ID

	if [ -f "./helpers/installers/${OS}.sh" ]; then
		. "./helpers/installers/${OS}.sh"

		install "$OS" "$OS_VERSION"
		exit 0
	else
		echo "At the moment, the os: '${OS}' is not supported.
		Please create an issue in https://github.com/s1n7ax/devcontainer-neovim-featurs/issues
		Include the /etc/os-release file content for us to identify the Linux distribution
		You are running.
		"
	fi
fi
