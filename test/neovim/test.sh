#!/bin/bash

set -euo pipefail

# This refers scenarios.json

set -euxo pipefail

source dev-container-features-test-lib

check "Neovim executable should be available" bash -c "nvim --version | grep 'NVIM v0.9.4'"

reportResults
