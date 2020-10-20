#!/bin/bash -ue

MODEL=${1:-""}

echo ""
echo "Will serve model as a HTTP API:"
echo "model: $MODEL"
echo ""

# run model training in the docker
(
  cd model && \
  poetry run \
  mlflow models serve -m $MODEL \
  -h 0.0.0.0 \
  -p 8001 \
  --no-conda
)
