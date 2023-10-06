#!/bin/sh

set -eux

install() {
	apt update
	apt install -y wget
	. helpers/installers/common.sh

	install
}
