
import os
from mlflow.tracking import MlflowClient


def main():
    tracking_server_uri = os.environ.get("MLFLOW_TRACKING_URI")
    client = MlflowClient(tracking_uri=tracking_server_uri)
    registered_models = client.list_registered_models()

    print(f"Found these models:")
    print ("----------------")
    for model in registered_models:
        print(model)
    print ("")


if __name__ == "__main__":
    main()
