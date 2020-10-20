#!/bin/bash -eu

echo ""
echo "Will build base docker container:"
echo ""

docker build -t $MLFLOW_BASE_CONTAINER_TAG ./base_container
