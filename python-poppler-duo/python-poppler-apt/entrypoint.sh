#!/usr/bin/env bash

service ssh start
bash copy_poppler_bins_to_minimal.sh

eval "$@"