#!/bin/bash

set -eux

TEMP_DIR="$(mktemp -d)"
cd "$TEMP_DIR"

apt update
apt install -y wget

wget "https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/nvim-linux64.tar.gz"
tar xf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz

# move the executable
mv --force nvim-linux64/bin/nvim /usr/local/bin

# --symbolic & --force flags does not exist in alpine & busybox
ln -s -f /usr/local/bin/nvim /usr/bin

# copy share files
cp --recursive --update --verbose nvim-linux64/share/* /usr/local/share
rm -rf nvim-linux64/share

# copy libs
cp --recursive --update --verbose nvim-linux64/lib/* /usr/local/lib
rm -rf nvim-linux64/lib

# copy man pages
cp --recursive --update --verbose nvim-linux64/man/* /usr/local/man
rm -rf nvim-linux64/man
