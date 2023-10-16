#!/bin/bash

set -euo pipefail

# This refers scenarios.json

set -euxo pipefail

source dev-container-features-test-lib

check "Gradle executable should be available" bash -c "gradle --version"
check "Gradle version should be 8.4" bash -c "gradle --version | grep 8.4"

reportResults
