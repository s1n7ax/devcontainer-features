#!/bin/bash

set -eux

apt update
apt install -y git

git clone https://github.com/LazyVim/starter ~/.config/nvim

if command -v nvim &>/dev/null; then
	nvim --headless "+Lazy! sync" +qa
fi
