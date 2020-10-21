#!/usr/bin/env sh

MODEL_NAME=$1
MODEL_ENVIRONMENT=$2

MODEL_NAME="sk-learn-random-forest-reg-model"
MODEL_ENVIRONMENT="Production"
MODEL_REFERENCE="models:/$MODEL_NAME/$MODEL_ENVIRONMENT"
source mlflow_env.sh
