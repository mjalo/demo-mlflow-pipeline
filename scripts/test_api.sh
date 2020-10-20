#!/bin/bash -ue

echo ""
echo "Will send test requests to model server:"
echo ""

# run model training in the docker
(
  cd model && \
  poetry run python ../scripts/test_api.py
)
