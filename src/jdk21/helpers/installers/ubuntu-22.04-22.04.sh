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
	https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21%2B35/OpenJDK21U-jdk_x64_linux_hotspot_21_35.tar.gz
tar xf jdk.tar.gz
mv jdk-21+35 /opt/jdk21

# JDTLS
if [ "$INSTALL_JDTLS" = "true" ]; then
	axel \
		--num-connections=5 \
		--output=jdtls.tar.gz \
		--insecure \
		https://www.eclipse.org/downloads/download.php?file=/jdtls/milestones/1.28.0/jdt-language-server-1.28.0-202309281329.tar.gz
	mkdir /opt/jdtls
	tar xf jdtls.tar.gz -C /opt/jdtls
fi
