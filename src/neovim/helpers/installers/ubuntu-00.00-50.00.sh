#!/bin/bash

set -eux

#--------------------------------------------------------------------#
#                               CONST                                #
#--------------------------------------------------------------------#
EXTRACTED_DIR_NAME="nvim-linux-x86_64"
COMPRESSED_FILE_NAME="${EXTRACTED_DIR_NAME}.tar.gz"
TEMP_DIR="$(mktemp -d)"

cd "$TEMP_DIR"

apt update
apt install -y wget

wget "https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/$COMPRESSED_FILE_NAME"
tar xf "$COMPRESSED_FILE_NAME"
rm "$COMPRESSED_FILE_NAME"

# move the executable
mv --force $EXTRACTED_DIR_NAME/bin/nvim /usr/local/bin

# --symbolic & --force flags does not exist in alpine & busybox
ln -s -f /usr/local/bin/nvim /usr/bin

# copy share files
cp --recursive --update --verbose ${EXTRACTED_DIR_NAME}/share/* /usr/local/share

# copy libs
cp --recursive --update --verbose ${EXTRACTED_DIR_NAME}/lib/* /usr/local/lib

# copy man pages
if [ -d ${EXTRACTED_DIR_NAME}/man ]; then
  cp --recursive --update --verbose ${EXTRACTED_DIR_NAME}/man/* /usr/local/man
fi

rm --recursive --force "$TEMP_DIR"
