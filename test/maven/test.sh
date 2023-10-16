#!/bin/bash

set -euo pipefail

# This refers scenarios.json

set -euxo pipefail

source dev-container-features-test-lib

check "Maven executable should be available" bash -c "which mvn"

reportResults
