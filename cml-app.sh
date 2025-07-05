#!/bin/bash

# Collect static files
python manage.py collectstatic --noinput

# Apply database migrations
python manage.py migrate

# Start the Django server using Gunicorn
gunicorn ArabDataMarketPlace.wsgi:application \
  --bind 127.0.0.1:8000 \
  --workers 3 \
  --timeout 120
