#!/usr/bin/env bash

for name in `cat poppler_libs.txt` ; do  bash findcopy.sh $name; done
for name in `find /usr/local/bin -name 'pdf*'`; do bash copy.sh $name; done

scp -r /install/* root@minimal:/usr/local/lib/python3.7/site-packages/
scp /usr/local/lib/libpoppler-cpp.so.0 root@minimal:/usr/local/lib