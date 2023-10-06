#!/bin/sh

set -eux

# test lib cannot be used for alpine because it only support bash and alpine only got sh
# source dev-container-features-test-lib

ls ~/.config/nvim/lua/astronvim
