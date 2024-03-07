setlocal EnableDelayedExpansion

:: configure
cmake -Bbuild -H. ^
  -DBUILD_TESTING=OFF ^
  -DCMAKE_INSTALL_PREFIX=$PREFIX
if errorlevel 1 exit 1

:: build and install
cmake --build build\ --target install
if errorlevel 1 exit 1

:: test
ctest -R
if errorlevel 1 exit 1
