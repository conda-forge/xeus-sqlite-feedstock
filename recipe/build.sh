#!/bin/bash

set -euxo pipefail


if [[ ${target_platform} == linux-ppc64le ]]; then
  export CMAKE_ARGS="${CMAKE_ARGS} -DXSQL_DISABLE_TUNE_GENERIC=ON"
else
  export CMAKE_ARGS="${CMAKE_ARGS} -DXSQL_DISABLE_ARCH_NATIVE=ON"
fi

cmake -S "${SRC_DIR}" -B build/ -G Ninja ${CMAKE_ARGS}
cmake --build build/ --parallel "${CPU_COUNT}"
cmake --install build/
