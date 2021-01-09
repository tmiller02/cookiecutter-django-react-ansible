#!/bin/sh

set -e

TESTSSL_REPO=https://github.com/drwetter/testssl.sh.git
SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
REPO_DIR="${SCRIPT_DIR}/testssl.sh"

if [ ! -d "$REPO_DIR/.git" ]
  then
    git clone "$TESTSSL_REPO" "$REPO_DIR"
  else
    cd "$REPO_DIR"
    git pull "$TESTSSL_REPO"
fi

cd "$REPO_DIR"

set +e

./testssl.sh --full https://localhost:4000
./testssl.sh --full https://localhost:5000
