#!/bin/bash

set -euo pipefail

# This refers scenarios.json

set -euxo pipefail

source dev-container-features-test-lib

check "gradle executable should be available" bash -c "which gradle"

reportResults
