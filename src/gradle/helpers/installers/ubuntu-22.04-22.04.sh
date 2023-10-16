#!/bin/bash

set -euxo pipefail

TEMP="$(mktemp -d)"
cd "$TEMP"

apt update
apt install -y axel unzip

# JDK
axel \
	--num-connections=5 \
	--output=gradle.zip \
	--insecure \
	"https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip"

unzip gradle.zip
mv gradle-${GRADLE_VERSION} /opt/gradle
