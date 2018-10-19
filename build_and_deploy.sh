set -ex

cd tests
pip3 install nose coverage
python3 -m nose -v -w . --with-coverage --cover-package=Box2D
cd ..

if [[ ! -z "$TRAVIS_TAG" ]]; then
    
    PYPLATFORM=$(python3 get_platform.py)
    pip3 wheel . --wheel-dir=/tmp/wheelhouse --build-option --plat-name=$PYPLATFORM 
    ls -lht /tmp/wheelhouse

    pip3 install --user twine
    python3 -m twine upload /tmp/wheelhouse/box2d_py-*

    if [[ ! -z "$DEPLOY_SDIST" ]]; then
        python3 setup.py sdist       
        python3 -m twine upload dist/*
    fi
fi

