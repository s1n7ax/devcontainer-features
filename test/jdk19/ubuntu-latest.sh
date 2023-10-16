#!/bin/bash

set -euo pipefail

# This refers scenarios.json

set -euxo pipefail

source dev-container-features-test-lib

check "Java executable should be available" bash -c "java --version"
check "Java version should be jdk 19" bash -c "java --version | grep 'openjdk 19'"

reportResults
