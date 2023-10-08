#!/bin/bash

# This refers scenarios.json

set -euxo pipefail

source dev-container-features-test-lib

check "AstroNvim config is available" bash -c "ls ~/.config/nvim/lua/astronvim"

reportResults
