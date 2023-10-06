#!/bin/sh

set -eux

# DO NOT MAKE THIS BASH
# In the pipeline tests, this will be ran against alpine & other
# shell script only environments so it's important to keep this
# a sh script

nvim --version | grep NVIM
nvim --version | grep 'NVIM v0.9.2'
