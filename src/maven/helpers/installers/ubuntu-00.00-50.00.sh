#!/bin/bash

set -euxo pipefail

TEMP="$(mktemp -d)"
cd "$TEMP"

apt update
apt install -y axel unzip

# JDK
axel \
	--num-connections=5 \
	--output=mvn.tar.gz \
	--insecure \
	"https://dlcdn.apache.org/maven/maven-3/3.9.5/binaries/apache-maven-${MVN_VERSION}-bin.tar.gz"

tar xf mvn.tar.gz
mv "apache-maven-${MVN_VERSION}" /opt/mvn
