#!/bin/bash

CUDA_VISIBLE_DEVICES=1 python neural_style/neural_style_vgg19.py train \
  --dataset ./dataset \
  --style-image ./images/style-images/style-1.jpg \
  --style-size 256 \
  --save-model-dir ./saved_models/style-1 \
  --checkpoint-model-dir ./saved_checkpoint/style-1 \
  --epochs 2 \
  --batch-size 20 \
  --cuda 1

# CUDA_VISIBLE_DEVICES=0 python neural_style/neural_style_vgg19.py train \
#   --dataset ./dataset \
#   --style-image ./images/style-images/style-6.jpg \
#   --style-size 256 \
#   --save-model-dir ./saved_models/style-6 \
#   --checkpoint-model-dir ./saved_checkpoint/style-6 \
#   --epochs 2 \
#   --batch-size 20 \
#   --cuda 1
