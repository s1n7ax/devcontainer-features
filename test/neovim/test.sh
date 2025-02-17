#!/bin/bash

set -euo pipefail

# This refers scenarios.json

source dev-container-features-test-lib

check "Neovim executable should be available" bash -c "nvim --version"
check "Neovim version should be latest stable version" bash -c "nvim --version | grep 'NVIM v0.10.4'"

reportResults
