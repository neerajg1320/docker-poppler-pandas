#!/usr/bin/env bash

# Change the library for libpoppler.so.
for name in `cat poppler_libs.txt` ; do  bash findcopy.sh $name; done
for name in `find /usr/local/bin -name 'pdf*'`; do bash copy.sh $name; done