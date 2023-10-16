#!/bin/bash

set -euxo pipefail

TEMP="$(mktemp -d)"
cd "$TEMP"

apt update
apt install -y axel

# JDK
axel \
	--num-connections=5 \
	--output=jdk.tar.gz \
	--insecure \
	https://github.com/adoptium/temurin19-binaries/releases/download/jdk-19.0.2%2B7/OpenJDK19U-jdk_aarch64_linux_hotspot_19.0.2_7.tar.gz
tar xf jdk.tar.gz
mv jdk-19.0.2+7 /opt/jdk19
