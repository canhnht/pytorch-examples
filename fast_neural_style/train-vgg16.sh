#!/bin/bash

CUDA_VISIBLE_DEVICES=1 python neural_style/neural_style.py train \
  --dataset ./dataset/coco \
  --style-image ./images/style-images/photoac/0030.jpg \
  --style-size 512 \
  --save-model-dir ./saved_models/0030 \
  --checkpoint-model-dir ./saved_checkpoint/0030 \
  --epochs 4 \
  --batch-size 16 \
  --cuda 1

CUDA_VISIBLE_DEVICES=1 python neural_style/neural_style.py train \
  --dataset ./dataset/coco \
  --style-image ./images/style-images/photoac/0030.jpg \
  --style-size 512 \
  --save-model-dir ./saved_models/0030 \
  --checkpoint-model-dir ./saved_checkpoint/0030 \
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
