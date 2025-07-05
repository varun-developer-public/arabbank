#!/bin/bash

echo "📦 Installing Python dependencies from requirements.txt..."
pip3 install -r requirements.txt

echo "📂 Collecting static files..."
python3 manage.py collectstatic --noinput

echo "🧱 Applying database migrations..."
python3 manage.py migrate

echo "🚀 Starting Gunicorn server..."
exec gunicorn ArabDataMarketPlace.wsgi:application --bind=127.0.0.1:8000 --workers=3 --timeout=120
