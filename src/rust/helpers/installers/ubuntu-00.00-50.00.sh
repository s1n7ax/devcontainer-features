#!/bin/bash

set -euxo pipefail

apt-get update

if [ -z "$RUST_CHANNEL" ]; then
	RUST_CHANNEL="nightly"
fi

apt-get update &&
	apt-get -y install \
		--no-install-recommends \
		curl=7.81.0-1ubuntu1.15 \
		ca-certificates=20230311ubuntu0.22.04.1 \
		build-essential=12.9ubuntu3 &&
	rm -rf /var/lib/apt/lists/*

curl https://sh.rustup.rs -sSf | bash -s -- -y --default-toolchain "$RUST_CHANNEL"

rustup target add "${RUSTUP_TARGETS[@]}"

cargo install --locked "${CARGO_PACKAGES[@]}"
