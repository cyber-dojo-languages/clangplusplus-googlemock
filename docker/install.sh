#!/bin/bash
set -e

readonly GMOCK_VERSION=1.7.0

apt-get update
apt-get install --yes cmake unzip

cd /usr/src
unzip gmock-${GMOCK_VERSION}.zip

cd /usr/src/gmock-${GMOCK_VERSION}
cmake DCMAKE_CXX_FLAGS='-Wno-unused-local-typedefs' .
make
mv libg* /usr/lib
cp -rf include/gmock /usr/include

cd /usr/src/gmock-${GMOCK_VERSION}/gtest
mv libg* /usr/lib
cp -rf include/gtest /usr/include

apt-get remove --yes cmake unzip
