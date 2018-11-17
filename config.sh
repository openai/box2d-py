#!/bin/bash
function pre_build {
    set -ex
    build_swig
    pip install .
    pip install nose coverage
    nose -v -w tests/ --with-coverage --cover-package=Box2D
}

function run_tests {
    echo "Hello world with box2d-py"
}

