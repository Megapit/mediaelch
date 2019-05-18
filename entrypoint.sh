#!/bin/sh
set -e

PUID=${PUID:-20000}
PGID=${PGID:-20000}

groupmod -o -g "$PGID" $APP_USER
usermod -o -u "$PUID" $APP_USER

exec "$@"
