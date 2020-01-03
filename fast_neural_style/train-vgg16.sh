#!/bin/bash

CUDA_VISIBLE_DEVICES=1 python neural_style/neural_style.py train \
  --dataset ./dataset/coco \
  --style-image ./images/style-images/candy.jpg \
  --style-size 512 \
  --save-model-dir ./saved_models/candy \
  --checkpoint-model-dir ./saved_checkpoint/candy \
  --epochs 2 \
  --batch-size 16 \
  --cuda 1

CUDA_VISIBLE_DEVICES=2 python neural_style/neural_style.py train \
  --dataset ./dataset/coco \
  --style-image ./images/style-images/photoac/20200102/8beba7dc0bbba7d0b381ef5a3ece901a_l.jpg \
  --style-size 512 \
  --save-model-dir ./saved_models/8beba7dc0bbba7d0b381ef5a3ece901a_l \
  --checkpoint-model-dir ./saved_checkpoint/8beba7dc0bbba7d0b381ef5a3ece901a_l \
  --epochs 2 \
  --batch-size 10 \
  --cuda 1 \
  --log-interval 100

CUDA_VISIBLE_DEVICES=0 python neural_style/neural_style.py train \
  --dataset ./dataset/coco \
  --style-image ./images/style-images/photoac/0032.jpg \
  --style-size 512 \
  --save-model-dir ./saved_models/0032 \
  --checkpoint-model-dir ./saved_checkpoint/0032 \
  --epochs 2 \
  --batch-size 16 \
  --cuda 1
