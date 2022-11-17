#!/bin/bash

set -ex

export PYO3_CROSS_LIB_DIR="${PYO3_CROSS_LIB_DIR}/.."
#unset PYO3_CROSS_LIB_DIR
#unset PYO3_CROSS_PYTHON_VERSION
#unset PYO3_CROSS_PYTHON_IMPLEMENTATION
maturin build --release --bindings pyo3 --manylinux off --interpreter="${PYTHON}"

"${PYTHON}" -m pip install $SRC_DIR/target/wheels/nutpie*.whl --no-index --no-deps -vv

cargo-bundle-licenses --format yaml --output THIRDPARTY.yml
