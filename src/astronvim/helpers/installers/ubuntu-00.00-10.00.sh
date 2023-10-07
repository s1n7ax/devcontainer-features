#!/bin/bash

set -eux

apt update
apt install -y wget

TEMP_DIR="$(mktemp -d)"

cd "$TEMP_DIR"

wget "https://github.com/AstroNvim/AstroNvim/archive/refs/tags/$ASTRONVIM_VERSION.tar.gz"
tar xf "$ASTRONVIM_VERSION.tar.gz"
rm "$ASTRONVIM_VERSION.tar.gz"

mkdir -p ~/.config
mv "AstroNvim-${ASTRONVIM_VERSION#v}" ~/.config/nvim

local commands=("nvim" "git" "gcc" "c++")

local all_commands_found=true

for cmd in "${commands[@]}"; do
	if ! command -v "$cmd" &>/dev/null; then
		all_commands_found=false
	fi
done

if $all_commands_found; then
	nvim --headless "+Lazy! sync" +qa
else
	echo "Skipping installing AstroNvim"
	echo "Not any or all requirements are met"
	echo "Following should be present: nvim git gcc c++"
fi
