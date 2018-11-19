#!/bin/bash
function pre_build {
    set -ex
    build_swig
    pip install .
    pip install nose coverage
    nosetests -v -w tests/ --with-coverage --cover-package=Box2D
}

function run_tests {
    pip install gym[box2d]
    python -c "import gym; gym.make('LunarLander-v2')"
}

