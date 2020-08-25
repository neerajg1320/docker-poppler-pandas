#!/bin/bash

file_path=$1
echo $file_path

set -x
scp $file_path root@minimal:$file_path
set +x