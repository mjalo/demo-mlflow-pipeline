#!/bin/bash -ue

echo ""
echo "Will list registered models:"
echo ""

# run model training in the docker
(
  cd model && \
  poetry run python ../scripts/list_registered_models.py
)
