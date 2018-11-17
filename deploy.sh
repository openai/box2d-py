set -ex

# if [[ ! -z "$TRAVIS_TAG" ]]; then
    ls -lht ./wheelhouse
    pip install twine
    # twine upload ./wheelhouse/box2d_py-*

    if [[ ! -z "$DEPLOY_SDIST" ]]; then
        python setup.py sdist       
        twine upload dist/*
    fi
# fi

