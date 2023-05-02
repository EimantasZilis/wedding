#!/bin/sh

# Waiting for postgres to start
# while ! nc -z postgres ${POSTGRES_PORT}; do
#   sleep 0.1
# done



echo "Hello world"
cd basic_app
# Run migrations
python manage.py migrate --noinput || exit 1

exec "$@"