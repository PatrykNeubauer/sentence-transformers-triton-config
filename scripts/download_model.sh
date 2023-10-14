#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Usage: $0 <model_name>"
  exit 1
fi

optimum-cli export onnx --model $1 temp/model/