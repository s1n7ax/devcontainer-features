#!/bin/bash

set -eu

pkgs=(build-essential curl git python3 python3-pip python-is-python3 ripgrep)

for pkg in ${pkgs[@]}; do
	pkg_full_name="$(apt -qq list --installed $pkg)"

	if [ -z "$pkg_full_name" ]; then
		echo "$pkg was not installed" >&2
		exit 1
	fi
done
