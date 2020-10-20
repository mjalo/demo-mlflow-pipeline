#!/usr/bin/env sh

# Base container build env
export MLFLOW_BASE_CONTAINER_NAME=mlflow-base-container
export MLFLOW_BASE_CONTAINER_VERSION=0.0.1
export MLFLOW_BASE_CONTAINER_TAG=$MLFLOW_BASE_CONTAINER_NAME:$MLFLOW_BASE_CONTAINER_VERSION

# Model container
export MODEL_CONTAINER_NAME=mlflow-patient-noshow-model-container
export MODEL_CONTAINER_VERSION=0.0.1
export MODEL_CONTAINER_TAG=$MODEL_CONTAINER_NAME:$MODEL_CONTAINER_VERSION

# Set environment variable for the tracking URL where the Model Registry resides
export MLFLOW_SERVER_HOST="http://127.0.0.1"
export MLFLOW_SERVER_PORT=5000
export MLFLOW_TRACKING_URI="$MLFLOW_SERVER_HOST:$MLFLOW_SERVER_PORT"

export MLFLOW_MODEL_LOCAL_HOST="http://127.0.0.1"
export MLFLOW_MODEL_LOCAL_PORT=8001
