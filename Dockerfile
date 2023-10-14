FROM nvcr.io/nvidia/tritonserver:23.09-py3 

ARG MODEL_NAME="sentence-transformers/all-MiniLM-L6-v2" 
ARG TEMP_MODEL_PATH="temp/model"
ARG MODEL_REPO_PATH="/model_repository/"

# Setup
RUN mkdir -p $TEMP_MODEL_PATH
RUN mkdir -p $MODEL_REPO_PATH

COPY scripts/ .
COPY requirements.txt .

RUN pip install --upgrade pip
RUN pip install -r requirements.txt


# Prepare model repository
COPY model_repository/* $MODEL_REPO_PATH

# Download the model
RUN chmod +x ./download_model.sh
RUN ./download_model.sh $MODEL_NAME $TEMP_MODEL_PATH

# Move model into model repository
RUN chmod +x ./populate_model_repository.sh
RUN ./populate_model_repository.sh $TEMP_MODEL_PATH $MODEL_REPO_PATH