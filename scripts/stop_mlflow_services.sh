#!/bin/bash -ue

echo ""
echo "Will stop mlflow server and model database"
echo ""

(
cd mlflow_services && \
docker-compose down
)
