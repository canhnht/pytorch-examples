#!/bin/bash

CUDA_VISIBLE_DEVICES=0 python neural_style/neural_style.py train \
  --dataset ./dataset \
  --style-image ./images/style-images/style-1.jpg \
  --style-size 512 \
  --save-model-dir ./saved_models/style-1 \
  --checkpoint-model-dir ./saved_checkpoint/style-1 \
  --epochs 2000 \
  --batch-size 10 \
  --cuda 1

# CUDA_VISIBLE_DEVICES=1 python neural_style/neural_style.py train \
#   --dataset ./dataset \
#   --style-image ./images/style-images/style-5.jpg \
#   --style-size 512 \
#   --save-model-dir ./saved_models/style-5 \
#   --checkpoint-model-dir ./saved_checkpoint/style-5 \
#   --epochs 2 \
#   --batch-size 16 \
#   --cuda 1

# CUDA_VISIBLE_DEVICES=2 python neural_style/neural_style.py train \
#   --dataset ./dataset \
#   --style-image ./images/style-images/style-7.jpg \
#   --style-size 512 \
#   --save-model-dir ./saved_models/style-7 \
#   --checkpoint-model-dir ./saved_checkpoint/style7 \
#   --epochs 2 \
#   --batch-size 10 \
#   --cuda 1
