#!/bin/bash

CUDA_VISIBLE_DEVICES=0 python neural_style/neural_style.py train \
  --dataset ./dataset/coco \
  --style-image ./images/style-images/photoac/0029.jpg \
  --style-size 512 \
  --save-model-dir ./saved_models/0029 \
  --checkpoint-model-dir ./saved_checkpoint/0029 \
  --epochs 2 \
  --batch-size 16 \
  --cuda 1

CUDA_VISIBLE_DEVICES=1 python neural_style/neural_style.py train \
  --dataset ./dataset/coco \
  --style-image ./images/style-images/photoac/0031.jpg \
  --style-size 512 \
  --save-model-dir ./saved_models/0031 \
  --checkpoint-model-dir ./saved_checkpoint/0031 \
  --epochs 2 \
  --batch-size 16 \
  --cuda 1

CUDA_VISIBLE_DEVICES=2 python neural_style/neural_style.py train \
  --dataset ./dataset/coco \
  --style-image ./images/style-images/photoac/0032.jpg \
  --style-size 512 \
  --save-model-dir ./saved_models/0032 \
  --checkpoint-model-dir ./saved_checkpoint/0032 \
  --epochs 2 \
  --batch-size 16 \
  --cuda 1
