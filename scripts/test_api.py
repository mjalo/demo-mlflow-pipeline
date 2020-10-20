
import os
import pandas as pd
import requests

host = os.environ.get("MLFLOW_MODEL_LOCAL_HOST")
port = os.environ.get("MLFLOW_MODEL_LOCAL_PORT")

# get some test data
test_data = pd.read_csv("data/wine-quality.csv").head(5)
test_data = test_data.loc[:, test_data.columns != 'quality']

# make prediction requests
url = f'{host}:{port}/invocations'
headers = {'Content-Type': 'application/json',}
http_data = test_data.to_json(orient='split')

print(f"Requesting with data:\n{http_data}")
print("")

r = requests.post(url=url, headers=headers, data=http_data)
print(f'Predictions:\n{r.text}')
print("")
