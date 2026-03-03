#!/bin/bash -Eeu

readonly GTEST_VERSION=1.17.0

# to speed up linking : -fuse-ld=mold
apt-get update -y
apt-get install --yes --no-install-recommends cmake unzip mold
apt-get clean

cd /usr/src
unzip googletest-release-${GTEST_VERSION}.zip
cd /usr/src/googletest-${GTEST_VERSION}
cmake .
make

apt-get remove --yes cmake unzip
mv lib/libg* /usr/lib
cp -rf googlemock/include/gmock /usr/include
cp -rf googletest/include/gtest /usr/include

CXX_PCH_FLAGS="-std=c++2a -pthread -O -fsanitize=leak,address"
mkdir -p /usr/local/include/gtest
clang++ -x c++-header ${CXX_PCH_FLAGS} \
    /usr/include/gtest/gtest.h \
    -o /usr/local/include/gtest/gtest.h.pch

mkdir -p /usr/local/include/gmock
clang++ -x c++-header ${CXX_PCH_FLAGS} \
    /usr/include/gmock/gmock.h \
    -o /usr/local/include/gmock/gmock.h.pch
