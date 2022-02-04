#!/bin/bash

uvicorn \
  {{ cookiecutter.project_slug }}.asgi:application \
  --workers 1 \
  --host 0.0.0.0 \
  --port 4001 \
  --reload \
  --reload-exclude ".git, .idea, venv"