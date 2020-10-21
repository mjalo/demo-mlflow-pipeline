## Mlflow local development pipeline demo

A simple demo that displays how machine learning models can be trained, packaged and deployed to a REST api.

The point is to make local scripts relatively easy to package into dockerized applications that can be shipped to a target execution environment.

### Local development setup

Some tools are required to run this demo:
- Docker
- Docker compose
- Python 3.7
- Poetry (for virtualenvs and depedencies)
- Make

## Overview of the components

#### base_container

Provides the docker base with the slowly chaning operating system components, like gcc compilers and other nastier dependencies that are often needed for machine learning and data science packages.

By using base containers, we can iterate faster on actual model dependencies and code.

#### mlflow_services

Contains docker-compose definition of mlflow services that allow us to run mlflow as is we had a production-like instance locally.

Two containers are started with the docker-compose.yml:  
- **mlflow server**: provides a ui and api for model training metrics and artifacts
- **model database**: postgres database that stores the server and model data

By default, model artifacts are saved to a path outlined in mlflow_env.sh:

`/tmp/mlruns`

#### model

Contains the code and resources that define a model and its environment:
- training code: train.py
- dependencies: handled by poetry in poetry.lock and pyproject.toml
- Dockerfile: recipe on how to create a docker environment for the model
- requirements: poetry dependencies (exact hashes) are rendered into a requirements.txt as this is faster to install into the docker container

#### scripts

Contains recipes for common tasks to make building, serving, testing and deploying nicer.

#### mlflow_env.sh

Contains some common configuration for the local development environment, passed as environment variables


## Running the demo


#### Install tooling to run mlflow

Install local python dependencies to run mlflow stuff, run in bash:  

`make init_local`


#### Build the containers

Next, build the base and model containers.

Build the base container:  

`make build_base_container`

Build model container:  

`make build_model_container`


#### Start mlflow services

Start mlflow server and database by running:    

`make start_mlflow_services`

After this, mlflow UI should be accessible in your browser via:  
http://localhost:5000

#### Train the model

Train the model by running:  

`make train_model`

When this is done, you should be able to see the model run in the mlflow UI at:  
http://localhost:5000

#### Serve the model

To serve the model as an API, we need to figure out the reference to the model run. This can be done using:  

`make list_models`

This prints the model versions that are stored in mlflow model registry.

A model reference to use for serving looks like:  
source='file:///tmp/mlruns/0/8c016424af2f406388cd579f69ec296d/artifacts/model'

To serve a model, run:  
`make serve_model MODEL="/tmp/mlruns/0/8c016424af2f406388cd579f69ec296d/artifacts/model"`

Replacing the parameter with the model reference (without the file:// part).

#### Test the model API

When the model is running, open another terminal and run:  
`make test_api`

This sends some test requests to the model (few first rows of the dataset without the target variable).

The response should be the predictions that the model serves via the REST api

#### Shut down

To shut down the model serving, just go to that terminal and CTRL+C.

To shut down the mlflow services, run:  
`make stop_mlflow_services`
