# Base container for mlflow projects

FROM python:3.7-slim

RUN apt-get update && \
  apt-get install -y --no-install-recommends gcc python3-dev libssl-dev build-essential cmake g++ git wget && \
  pip install mlflow==1.11.0 psycopg2-binary==2.8.6  && \
  apt-get autoremove -y
