#!/bin/bash

CUDA_VISIBLE_DEVICES=0 python neural_style/neural_style_vgg19_small.py train \
  --dataset ./dataset/coco \
  --style-image ./images/style-images/ostagram/style-1.jpg \
  --style-size 512 \
  --save-model-dir ./saved_models/style-1 \
  --checkpoint-model-dir ./saved_checkpoint/style-1 \
  --epochs 2 \
  --batch-size 16 \
  --cuda 1 \
  --log-interval 100 \
  --content-weight 5 \
  --style-weight 150

CUDA_VISIBLE_DEVICES=0 python neural_style/neural_style_vgg19_small.py train \
  --dataset ./dataset/coco \
  --style-image ./images/style-images/photoac/20200102/5cfdb3ffa937edcbf5d572347ee680fa_l.jpg \
  --style-size 512 \
  --save-model-dir ./saved_models/5cfdb3ffa937edcbf5d572347ee680fa_l \
  --checkpoint-model-dir ./saved_checkpoint/5cfdb3ffa937edcbf5d572347ee680fa_l \
  --epochs 2 \
  --batch-size 10 \
  --cuda 1 \
  --log-interval 100 \
  --content-weight 5 \
  --style-weight 100


CUDA_VISIBLE_DEVICES=2 python neural_style/neural_style_vgg19_small.py train \
  --dataset ./dataset/coco \
  --style-image ./images/style-images/photoac/0025.jpg \
  --style-size 1024 \
  --save-model-dir ./saved_models/0025 \
  --checkpoint-model-dir ./saved_checkpoint/0025 \
  --epochs 2 \
  --batch-size 12 \
  --cuda 1 \
  --log-interval 100 \
  --content-weight 5 \
  --style-weight 100

CUDA_VISIBLE_DEVICES=0 python neural_style/neural_style_vgg19_small.py train \
  --dataset ./dataset/coco \
  --style-image ./images/style-images/style-1.jpg \
  --style-size 512 \
  --save-model-dir ./saved_models/style-1 \
  --checkpoint-model-dir ./saved_checkpoint/style-1 \
  --epochs 2 \
  --batch-size 16 \
  --cuda 1 \
  --log-interval 100 \
  --content-weight 0.5 \
  --style-weight 100

CUDA_VISIBLE_DEVICES=0 python neural_style/neural_style_vgg19_small.py train \
  --dataset ./dataset/coco \
  --style-image ./images/style-images/photoac/0037.jpg \
  --style-size 512 \
  --save-model-dir ./saved_models/0037 \
  --checkpoint-model-dir ./saved_checkpoint/0037 \
  --epochs 2 \
  --batch-size 16 \
  --cuda 1 \
  --log-interval 100 \
  --content-weight 0.5 \
  --style-weight 10
