#!/bin/bash

# This refers scenarios.json

set -e

source dev-container-features-test-lib

check "Neovim executable should be available" bash -c "nvim --version | grep NVIM"
check "Default Neovim version should be v0.9.2" bash -c "nvim --version | grep 'NVIM v0.9.2'"

reportResults
