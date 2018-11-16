set -ex

pip install .
cd tests
pip install --user nose coverage
python -m nose -v -w . --with-coverage --cover-package=Box2D
cd ..

if [[ ! -z "$TRAVIS_TAG" ]]; then
    
    PYPLATFORM=$(python3 get_platform.py)
    pip wheel . --wheel-dir=/tmp/wheelhouse --build-option --plat-name=$PYPLATFORM 
    ls -lht /tmp/wheelhouse

    pip install --user twine
    python -m twine upload /tmp/wheelhouse/box2d_py-*

    if [[ ! -z "$DEPLOY_SDIST" ]]; then
        python setup.py sdist       
        python -m twine upload dist/*
    fi
fi

