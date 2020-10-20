#!/bin/bash -ue

echo ""
echo "Will restart mlflow server and model database"
echo ""

( cd mlflow_services && \
  docker-compose down && \
  docker-compose up -d
)
