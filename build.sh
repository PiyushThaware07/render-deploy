#!/usr/bin/env bash

# Exit immediately if any command exits with a non-zero status (errexit)
set -e

# Install project dependencies using Poetry
poetry install

# Upgrade pip inside the virtual environment
/opt/render/project/src/.venv/bin/python -m pip install --upgrade pip

# Collect static files for Django without prompting
python manage.py collectstatic --no-input

# Apply database migrations for Django
python manage.py migrate
