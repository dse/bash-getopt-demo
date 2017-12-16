#!/usr/bin/evn bash

exec 2>&1

# NOTE: earlier versions of Bash treat the following differently:
# - $'\c\\'
# - $'\uxxxx'
# - $'\Uxxxxxxxx'

bin/bash-getopt-demo $'\c\\' $'\u00a1' $'\u2014' $'\U0001F4A9'
