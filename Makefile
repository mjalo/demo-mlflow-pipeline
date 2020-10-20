#!/usr/bin/make -f

# Propagate environment variables and set project level variables
.EXPORT_ALL_VARIABLES:
LOAD_ENV=source mlflow_env.sh

default:
	echo "Please use one of the valid commands."

init_local:
	$(LOAD_ENV) && bash -e scripts/install_local_dependencies.sh

build_base_container:
	$(LOAD_ENV) && bash -e scripts/build_mlflow_base_container.sh

build_model_container:
	$(LOAD_ENV) && bash -e scripts/build_mlflow_model_container.sh

start_mlflow_services:
	$(LOAD_ENV) && bash -e scripts/start_mlflow_services.sh

stop_mlflow_services:
	$(LOAD_ENV) && bash -e scripts/stop_mlflow_services.sh

mlflow_server_logs:
	$(LOAD_ENV) && docker logs mlflow_server --follow

train_model:
	$(LOAD_ENV) && bash -e scripts/train_model.sh

list_models:
	$(LOAD_ENV) && bash -e scripts/list_registered_models.sh

serve_model:
	$(LOAD_ENV) && bash -e scripts/serve_model.sh $$MODEL

test_api:
	$(LOAD_ENV) && bash -e scripts/test_api.sh

start_ipython:
	$(LOAD_ENV) && (cd model && poetry run ipython)
