#!/bin/bash

set -euxo pipefail

apt update

env

pkgs=()

if [ $GIT = "true" ]; then
	pkgs+=("git")
fi

if [ $BUILD_ESSENTIAL = "true" ]; then
	pkgs+=("build-essential")
fi

if [ $WGET = "true" ]; then
	pkgs+=("wget")
fi

if [ $CURL = "true" ]; then
	pkgs+=("curl")
fi

if [ $PYTHON3 = "true" ]; then
	pkgs+=("python3")
fi

if [ $PIP3 = "true" ]; then
	pkgs+=("python3-pip")
fi

if [ $PYTHON_IS_PYTHON3 = "true" ]; then
	pkgs+=("python-is-python3")
fi

if [ $RIPGREP = "true" ]; then
	pkgs+=("ripgrep")
fi

echo "${pkgs[@]}"

apt install -y "${pkgs[@]}"
