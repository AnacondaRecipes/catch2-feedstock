#!/bin/sh

set -e

# configure install
cmake -Bbuild -H. \
  -DBUILD_TESTING=OFF \
  -DCMAKE_INSTALL_PREFIX=$PREFIX

# build and install
cmake --build build/ --target install

# test
ctest -R
