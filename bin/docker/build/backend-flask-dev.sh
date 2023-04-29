#! /usr/bin/bash

SCRIPT_PATH=$(dirname $(readlink -f "$0"))
# bin/docker/build
BIN_PATH=$(dirname $(dirname $SCRIPT_PATH))
PROJECT_PATH=$(dirname $BIN_PATH)
BACKEND_FLASK_PATH="$PROJECT_PATH/backend-flask"

docker build \
-f "$BACKEND_FLASK_PATH/Dockerfile" \
-t backend-flask:dev \
"$BACKEND_FLASK_PATH"
