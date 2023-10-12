#!/bin/bash

set -euxo pipefail

TEMP="$(mktemp -d)"
cd "$TEMP"

apt update
apt install -y wget
wget -O jdk.tar.gz https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21%2B35/OpenJDK21U-jdk_x64_linux_hotspot_21_35.tar.gz
tar xf jdk.tar.gz
mv jdk-21+35 /opt/jdk

export PATH="/opt/jdk/bin:$PATH"
export JAVA_HOME="/opt/jdk"
