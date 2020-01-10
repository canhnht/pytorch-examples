#!/bin/bash

CUDA_VISIBLE_DEVICES=1 python neural_style/neural_style_vgg16_small.py train \
  --dataset ./dataset/coco \
  --style-image ./images/style-images/candy.jpg \
  --style-size 512 \
  --save-model-dir ./saved_models/candy \
  --checkpoint-model-dir ./saved_checkpoint/candy \
  --epochs 2 \
  --batch-size 16 \
  --cuda 1

CUDA_VISIBLE_DEVICES=2 python neural_style/neural_style_vgg16_small.py train \
  --dataset ./dataset/coco \
  --style-image ./images/style-images/style-20200110/1.jpg \
  --style-size 512 \
  --save-model-dir ./saved_models/style-20200110/1 \
  --checkpoint-model-dir ./saved_checkpoint/style-20200110/1 \
  --epochs 2 \
  --batch-size 10 \
  --cuda 1 \
  --log-interval 100

CUDA_VISIBLE_DEVICES=0 python neural_style/neural_style_vgg16_small.py train \
  --dataset ./dataset/coco \
  --style-image ./images/style-images/photoac/0032.jpg \
  --style-size 512 \
  --save-model-dir ./saved_models/0032 \
  --checkpoint-model-dir ./saved_checkpoint/0032 \
  --epochs 2 \
  --batch-size 16 \
  --cuda 1
