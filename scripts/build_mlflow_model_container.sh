#!/bin/bash -eux

echo ""
echo "Will build model container"
echo ""

# Output poetry dependencies with exact hashes - replicate dependencies without poetry in the container
(cd model && poetry export -f requirements.txt --output requirements/requirements.txt)

# build container - tag is set in the "mlflow_env.sh"
docker build -t $MODEL_CONTAINER_TAG ./model --build-arg MLFLOW_BASE_CONTAINER_TAG=$MLFLOW_BASE_CONTAINER_TAG
