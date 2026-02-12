#!/bin/sh

# Apply database migrations
echo "Applying database migrations..."
python manage.py migrate --noinput

# Execute the main command
exec "$@"
