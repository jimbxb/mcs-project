#!/bin/bash

texcount -inc -merge -1 -sum -tex $1 | LC_ALL=en_US.UTF-8 numfmt --grouping --zero-terminated
