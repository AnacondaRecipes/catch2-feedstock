#!/bin/sh

set -e

mkdir build
cd build

cmake -LAH -G"Ninja" \
  -DCMAKE_BUILD_TYPE=Release \
  ${RECIPE_DIR}/test

# build and install
cmake --build . --target all

# test
ctest -R

test -f "${PREFIX}/include/catch2/catch.hpp"
test -f "${PREFIX}/include/catch2/catch_reporter_automake.hpp"
test -f "${PREFIX}/include/catch2/catch_reporter_tap.hpp"
test -f "${PREFIX}/include/catch2/catch_reporter_teamcity.hpp"
test -f "${PREFIX}/lib/cmake/Catch2/Catch.cmake"
test -f "${PREFIX}/lib/cmake/Catch2/Catch2Config.cmake"
test -f "${PREFIX}/lib/cmake/Catch2/Catch2ConfigVersion.cmake"
test -f "${PREFIX}/lib/cmake/Catch2/Catch2Targets.cmake"
test -f "${PREFIX}/lib/cmake/Catch2/CatchAddTests.cmake"
test -f "${PREFIX}/lib/cmake/Catch2/ParseAndAddCatchTests.cmake"
