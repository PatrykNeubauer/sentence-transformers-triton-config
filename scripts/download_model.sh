#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 <model_name> <save_path>"
  exit 1
fi

optimum-cli export onnx --model $1 $2