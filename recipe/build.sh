#!/bin/bash

mkdir build
cd build

cmake ${CMAKE_ARGS} -G "Unix Makefiles" \
      -DCMAKE_BUILD_TYPE="Release" \
      -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
      -DCMAKE_POSITION_INDEPENDENT_CODE=1 \
      -DBUILD_STATIC=1 \
      -DBUILD_SHARED=1 \
      -DBUILD_TESTS=1 \
      -DBUILD_BENCHMARKS=0 \
      -DDEACTIVATE_SNAPPY=0 \
      "${SRC_DIR}"

cmake --build .
if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" ]]; then
ctest
fi
cmake --build . --target install
