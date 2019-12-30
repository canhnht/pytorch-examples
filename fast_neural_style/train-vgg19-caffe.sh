#!/bin/bash

CUDA_VISIBLE_DEVICES=0 python neural_style/neural_style_vgg19_caffe.py train \
  --dataset ./dataset/coco \
  --style-image ./images/style-images/style-1.jpg \
  --style-size 512 \
  --save-model-dir ./saved_models/style-1 \
  --checkpoint-model-dir ./saved_checkpoint/style-1 \
  --epochs 2 \
  --batch-size 10 \
  --cuda 1 \
  --log-interval 100 \
  --content-weight 0.5 \
  --style-weight 1000 \
  --lr 0.001

CUDA_VISIBLE_DEVICES=0 python neural_style/neural_style_vgg19_caffe.py train \
  --dataset ./dataset/coco \
  --style-image ./images/style-images/photoac/0001.jpg \
  --style-size 512 \
  --save-model-dir ./saved_models/0001 \
  --checkpoint-model-dir ./saved_checkpoint/0001 \
  --epochs 2 \
  --batch-size 10 \
  --cuda 1 \
  --log-interval 100 \
  --content-weight 0.5 \
  --style-weight 1000 \
  --lr 0.001

CUDA_VISIBLE_DEVICES=1 python neural_style/neural_style_vgg19_caffe.py train \
  --dataset ./dataset/coco \
  --style-image ./images/style-images/photoac/0002.jpg \
  --style-size 512 \
  --save-model-dir ./saved_models/0002 \
  --checkpoint-model-dir ./saved_checkpoint/0002 \
  --epochs 2 \
  --batch-size 10 \
  --cuda 1 \
  --log-interval 100 \
  --content-weight 1 \
  --style-weight 1 \
  --lr 0.001

CUDA_VISIBLE_DEVICES=2 python neural_style/neural_style_vgg19_caffe.py train \
  --dataset ./dataset/coco \
  --style-image ./images/style-images/photoac/0030.jpg \
  --style-size 512 \
  --save-model-dir ./saved_models/0030 \
  --checkpoint-model-dir ./saved_checkpoint/0030 \
  --epochs 2 \
  --batch-size 10 \
  --cuda 1 \
  --log-interval 100 \
  --content-weight 0.05 \
  --style-weight 1000 \
  --lr 1
