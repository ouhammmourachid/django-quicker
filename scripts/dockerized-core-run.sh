#!/usr/bin/env bash

set -e

RUN_MANAGE_PY='poetry run python -m core.manage'

echo 'Collecting static files...'
$RUN_MANAGE_PY collectstatic --no-input

echo 'Running migrations...'
$RUN_MANAGE_PY migrate --no-input

echo 'Starting the Core API...'
poetry run daphne -b 0.0.0.0 -p 8000 core.project.asgi:application
