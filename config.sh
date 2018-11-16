#!/bin/bash
function pre_build {
    set -ex
    build_swig
    pip install .
    cd tests
    pip install --user nose coverage
    python -m nose -v -w . --with-coverage --cover-package=Box2D
    cd ..
}

