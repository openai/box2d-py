set -ex

# if [[ ! -z "$TRAVIS_TAG" ]]; then
    ls -lht ./wheelhouse
    pip install --user twine
    # python -m twine upload ./wheelhouse/box2d_py-*

    if [[ ! -z "$DEPLOY_SDIST" ]]; then
        python setup.py sdist       
        python -m twine upload dist/*
    fi
# fi

