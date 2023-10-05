#!/bin/bash

# This refers scenarios.json

set -e

source dev-container-features-test-lib

check "Neovim executable should be available" bash -c "nvim --version | grep NVIM"
check "Neovim version should be nighly" bash -c "nvim --version | grep 'NVIM v0.10.0-dev'"

reportResults
