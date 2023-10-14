#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 <model_path> <model_repository_path>"
  exit 1
fi

model_path="$1"
model_repository_path="$2"


# Move 'model.onnx' to model directory
if [ -f "$model_path/model.onnx" ]; then
  mv "$model_path/model.onnx" "$model_repository_path/model/1/"
  echo "Moved 'model.onnx' to '$model_repository_path/model/1/'"
else
  echo "No 'model.onnx' file found in '$model_path'."
fi

# Move all other (tokenizer) files to its directory
for file in "$model_path"/*; do
  if [ "$file" != "$model_path/model.onnx" ]; then
    mv "$file" "$model_repository_path/tokenizer/1/"
    echo "Moved '$file' to '$model_repository_path/tokenizer/1/'"
  fi
done