#!/bin/sh

set -e

# DO NOT MAKE THIS BASH
# In the pipeline tests, this will be ran against alpine & other
# shell script only environments so it's important to keep this
# a sh script

ls -la ~/.config/nvim/lua/astronvim
