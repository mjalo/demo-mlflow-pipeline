
ARG MLFLOW_BASE_CONTAINER_TAG=mlflow-base-container:latest
FROM $MLFLOW_BASE_CONTAINER_TAG

# Copy requirements
COPY requirements/requirements.txt ./

# Install dependencies
RUN pip install -r requirements.txt

# Use a non-root user (root is not nice)
RUN groupadd -r ml_model && useradd --no-log-init -r -g ml_model ml_model

# Copy the model code into the container
ENV PIPELINE_HOME=/home/ml_model
USER ml_model
WORKDIR $PIPELINE_HOME
COPY . $PIPELINE_HOME

# Disable the environment creation (via conda)
ENV MLFLOW_DISABLE_ENV_CREATION=true
