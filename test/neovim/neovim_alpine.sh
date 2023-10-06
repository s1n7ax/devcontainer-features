#!/bin/sh

set -eux

# test lib cannot be used for alpine because it only support bash and alpine only got sh
# source dev-container-features-test-lib

nvim --version | grep NVIM
nvim --version | grep 'NVIM v0.9.2'
