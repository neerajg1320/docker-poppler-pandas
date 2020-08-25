#!/usr/bin/env bash

POPPLER_VERSION=$1

if [[ $# -eq 0 ]]
then
    POPPLER_VERSION=20.08.0
#    POPPLER_VERSION=0.90.1
fi

POPPLER_PACKAGE_DIR="poppler-${POPPLER_VERSION}"
POPPLER_PACKAGE_FILE="${POPPLER_PACKAGE_DIR}.tar.xz"
POPPLER_PACKAGE_PATH="https://poppler.freedesktop.org/${POPPLER_PACKAGE_FILE}"

echo "Poppler Package Path: $POPPLER_PACKAGE_PATH"


# Utils to download and extract poppler downloaded package file
apt-get install -y wget xz-utils

# Download and extract the poppler package
echo "Download Started: $POPPLER_PACKAGE_PATH"
wget -q $POPPLER_PACKAGE_PATH
tar -xf $POPPLER_PACKAGE_FILE
cd $POPPLER_PACKAGE_DIR

## Following block is used as a breakpoint with no further processing
#if [[ $POPPLER_PACKAGE_FILE != "" ]]
#then
#    exit 0
#fi

# cmake and dependencies
apt install -y build-essential libpoppler-cpp-dev pkg-config cmake

# poppler compile dependencies
apt install -y libfreetype6-dev libfontconfig-dev \
    libjpeg-dev libopenjp2-7-dev


mkdir build
cd build
cmake ..
make
make install
ldconfig
rm -rf build