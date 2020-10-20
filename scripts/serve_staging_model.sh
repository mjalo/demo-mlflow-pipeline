#!/usr/bin/env sh

MODEL_NAME=$1
MODEL_ENVIRONMENT=$2

MODEL_NAME="sk-learn-random-forest-reg-model"
MODEL_ENVIRONMENT="Production"
MODEL_REFERENCE="models:/$MODEL_NAME/$MODEL_ENVIRONMENT"
source mlflow_env.sh

#pipenv run mlflow models serve -m models:/ElasticnetWineModel/Staging --model-uri /Users/mjalo/projects/mlflow/artifacts/0/af404e67c5fe42faa5ed8fb573476c5c/artifacts/model/

# Serve the production model from the model registry
#mlflow models serve -m "models:/sk-learn-random-forest-reg-model/Production"
#pipenv run mlflow models serve -m models:/ElasticnetWineModel/Staging --model-uri /Users/mjalo/projects/mlflow/artifacts/0/af404e67c5fe42faa5ed8fb573476c5c/artifacts/model/
