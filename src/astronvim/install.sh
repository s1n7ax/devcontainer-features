#!/bin/sh

set -eux

ASTRONVIM_VERSION="$VERSION"

if [ -f /etc/os-release ]; then
	. /etc/os-release

	OS="$ID"
	OS_VERSION="$VERSION_ID"

	echo "OS: $OS $OS_VERSION"

	if [ -f "./helpers/installers/${OS}.sh" ]; then
		echo "$OS specific installer found"

		. "./helpers/installers/${OS}.sh"

		echo "Installing AstroNvim"

		install

		exit 0

	else
		. helpers/installers/common.sh

		install

		if [ $? -nq 0 ]; then
			echo "At the moment, the os: '${OS}' is not supported.
			Please create an issue in https://github.com/s1n7ax/devcontainer-neovim-featurs/issues
			Include the /etc/os-release file content for us to identify the Linux distribution
			You are running.
			" >&2
			exit 1
		fi

		exit 0
	fi
else
	echo "/etc/os-release file was not found in the container" >&2
	echo "Unable to install neovim without knowing the OS" >&2
	exit 0
fi
