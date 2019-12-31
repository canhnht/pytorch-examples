#!/bin/bash

CUDA_VISIBLE_DEVICES=2 python neural_style/neural_style_vgg19_caffe.py train \
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

CUDA_VISIBLE_DEVICES=1 python neural_style/neural_style_vgg19_caffe.py train \
  --dataset ./dataset/coco \
  --style-image ./images/style-images/ostagram/style-23.jpg \
  --style-size 512 \
  --save-model-dir ./saved_models/style-23 \
  --checkpoint-model-dir ./saved_checkpoint/style-23 \
  --epochs 2 \
  --batch-size 16 \
  --cuda 1 \
  --log-interval 100 \
  --content-weight 0.5 \
  --style-weight 20


CUDA_VISIBLE_DEVICES=0 python neural_style/neural_style_vgg19_caffe.py train \
  --dataset ./dataset/coco \
  --style-image ./images/style-images/style-6.jpg \
  --style-size 512 \
  --save-model-dir ./saved_models/style-6 \
  --checkpoint-model-dir ./saved_checkpoint/style-6 \
  --epochs 2 \
  --batch-size 16 \
  --cuda 1 \
  --log-interval 100 \
  --content-weight 0.5 \
  --style-weight 10

CUDA_VISIBLE_DEVICES=0 python neural_style/neural_style_vgg19_caffe.py train \
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

CUDA_VISIBLE_DEVICES=0 python neural_style/neural_style_vgg19_caffe.py train \
  --dataset ./dataset/coco \
  --style-image ./images/style-images/photoac/0030.jpg \
  --style-size 512 \
  --save-model-dir ./saved_models/0030 \
  --checkpoint-model-dir ./saved_checkpoint/0030 \
  --epochs 2 \
  --batch-size 16 \
  --cuda 1 \
  --log-interval 100 \
  --content-weight 0.5 \
  --style-weight 10
