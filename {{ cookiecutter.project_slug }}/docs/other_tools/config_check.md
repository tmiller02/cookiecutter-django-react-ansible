# Config Check

## Overview

The [config_check](../../other_tools/config_check) directory contains some
scripts that you can use to check for common configuration problems

## testssl_dev.sh

Tests the TLS/SSL encryption configuration of hosts in the 'dev' environment
with [testssl.sh](https://github.com/drwetter/testssl.sh/).

Example usage:

    cd {{ cookiecutter.project_slug }}
    vagrant up --provision
    ./other_tools/config_check/testssl_dev.sh
