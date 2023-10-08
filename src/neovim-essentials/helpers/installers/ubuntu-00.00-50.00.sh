#!/bin/bash

apt update

apt install -y \
	build-essential \
	wget \
	curl \
	git \
	python3 \
	python3-pip \
	python-is-python3 \
	ripgrep
