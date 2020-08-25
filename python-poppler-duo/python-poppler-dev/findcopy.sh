#!/bin/bash

file_path=$(find / -name $1 -not -path "*/build/*")
echo $file_path

set -x
scp $file_path root@minimal:$file_path
set +x