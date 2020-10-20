#!/bin/bash -ue

echo ""
echo "Will train project model"
echo ""

# run model training in the docker
(
  cd model && \
  poetry run mlflow run . -P alpha=0.5 --no-conda
)
