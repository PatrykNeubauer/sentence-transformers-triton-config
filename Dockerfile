FROM nvcr.io/nvidia/tritonserver:23.09-py3

COPY requirements.txt .

RUN pip install --upgrade pip
RUN pip install -r requirements.txt