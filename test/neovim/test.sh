#!/bin/bash

set -euo pipefail

# This refers scenarios.json

source dev-container-features-test-lib

check "Neovim executable should be available" bash -c "nvim --version"
check "Neovim version should be nightly" bash -c "nvim --version | grep 'NVIM v0.11.0-dev'"

reportResults
