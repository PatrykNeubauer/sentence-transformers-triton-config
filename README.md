### Download the model
First, you need to create python environment and install the requirements:
```
python3 -m venv venv
source venv/bin/activate
python3 -m pip install -r requirements.txt
```
Then download any sentence-transformer model from HuggingFace and move it into the model repository:
```
mkdir -p <TEMP_DIR_PATH>
scripts/download_model.sh <MODEL_NAME> <TEMP_DIR_PATH>
scripts/populate_model_repository.sh <TEMP_DIR_PATH> model_repository/
```
with e.g. `<TEMP_DIR_PATH>=temp/model` and `MODEL_NAME=sentence-transformers/all-MiniLM-L6-v2`.

At last, you need to build and run triton docker image with additional libraries:
```
docker build -t <IMAGE_NAME> .
scripts/run_triton_server.sh <IMAGE_NAME>
```