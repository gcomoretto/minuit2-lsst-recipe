#!/bin/bash

set -x -e

INCLUDE_PATH="${PREFIX}/include"
LIBRARY_PATH="${PREFIX}/lib $LIBRARY_PATH"

if [ "$(uname)" == "Darwin" ]; then
    TOOLSET=clang
    CC=clang
    CXX=clang++
elif [ "$(uname)" == "Linux" ]; then
    TOOLSET=gcc
fi

export CXXFLAGS="${CXXFLAGS} -fPIC -std=c++14 -D_GLIBCXX_USE_CXX11_ABI=0"

./configure --prefix=${PREFIX} --disable-openmp --libdir=$PREFIX/lib

make
make install
