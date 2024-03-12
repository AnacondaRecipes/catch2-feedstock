setlocal EnableDelayedExpansion

:: Make a build folder and change to it
mkdir build
cd build

:: configure
cmake -LAH -G"Ninja" ^
  -DCMAKE_BUILD_TYPE:STRING=Release ^
  %RECIPE_DIR%/test

if errorlevel 1 exit 1

:: build and install
cmake --build . --target all
if errorlevel 1 exit 1

:: test
ctest -R
if errorlevel 1 exit 1

if not exist %PREFIX%\\include\\catch2\\catch.hpp exit 1
if not exist %PREFIX%\\include\\catch2\\catch_reporter_automake.hpp exit 1
if not exist %PREFIX%\\include\\catch2\\catch_reporter_tap.hpp exit 1
if not exist %PREFIX%\\include\\catch2\\catch_reporter_teamcity.hpp exit 1
if not exist %PREFIX%\\lib\\cmake\\Catch2\\Catch.cmake exit 1
if not exist %PREFIX%\\lib\\cmake\\Catch2\\Catch2Config.cmake exit 1
if not exist %PREFIX%\\lib\\cmake\\Catch2\\Catch2ConfigVersion.cmake exit 1
if not exist %PREFIX%\\lib\\cmake\\Catch2\\Catch2Targets.cmake exit 1
if not exist %PREFIX%\\lib\\cmake\\Catch2\\CatchAddTests.cmake exit 1
if not exist %PREFIX%\\lib\\cmake\\Catch2\\ParseAndAddCatchTests.cmake exit 1
