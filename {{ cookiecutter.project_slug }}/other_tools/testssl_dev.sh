#!/bin/sh

TESTSSL_REPO=https://github.com/drwetter/testssl.sh.git
SCRIPT_DIR="$( cd "$(dirname "$0")" || exit ; pwd -P )"
REPO_DIR="${SCRIPT_DIR}/testssl.sh"

if [ ! -d "$REPO_DIR/.git" ]
  then
    git clone "$TESTSSL_REPO" "$REPO_DIR"
  else
    cd "$REPO_DIR" || exit
    git pull "$TESTSSL_REPO"
fi

cd "$REPO_DIR" || exit

./testssl.sh --full https://{{ cookiecutter.frontend_app_dev_hostname }}
./testssl.sh --full https://{{ cookiecutter.backend_app_dev_hostname }}
