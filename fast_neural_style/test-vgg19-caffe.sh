#!/bin/bash

python neural_style/neural_style_vgg19_caffe.py eval \
  --content-image ./images/content-images/content-1.jpg \
  --model ./saved_models/0001/19_caffe_epoch_2_Mon_Dec_30_11:09:51_2019_0.5_1000.0.model \
  --output-image ./images/output-images/content-1-19caffe-2.jpg \
  --cuda 0 \
  --output-size 512


python neural_style/neural_style_vgg19_caffe.py eval \
  --content-image ./images/content-images/boys.jpg \
  --model ./saved_models/0002/19_caffe_epoch_2_Mon_Dec_30_11:11:35_2019_1.0_1.0.model \
  --output-image ./images/output-images/boys-19caffe-1.jpg \
  --cuda 0 \
  --output-size 1024


python neural_style/neural_style_vgg19_caffe.py eval \
  --content-image ./images/content-images/boys.jpg \
  --model ./saved_models/0004/19_caffe_epoch_2_Thu_Dec_26_11:06:28_2019_1.0_1.0.model \
  --output-image ./images/output-images/boys-19caffe-2.jpg \
  --cuda 0 \
  --output-size 1024
