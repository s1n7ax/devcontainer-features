#!/bin/bash

set -euo pipefail

# This refers scenarios.json

set -euxo pipefail

source dev-container-features-test-lib

check "Maven executable should be available" bash -c "mvn --version"
check "Maven version should be 3.9.5" bash -c "mvn --version | grep 3.9.5"

reportResults
