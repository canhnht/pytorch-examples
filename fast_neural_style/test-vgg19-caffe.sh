#!/bin/bash

python neural_style/neural_style_vgg19_caffe.py eval \
  --content-image ./images/content-images/content-1.jpg \
  --model ./saved_models/style-1/19_caffe_epoch_2_Tue_Dec_31_12:36:26_2019_0.5_10.0.model \
  --output-image ./images/output-images/content-1-19caffe-1.jpg \
  --cuda 0 \
  --output-size 1024


python neural_style/neural_style_vgg19_caffe.py eval \
  --content-image ./images/content-images/boys.jpg \
  --model ./saved_models/style-6/19_caffe_epoch_2_Tue_Dec_31_12:55:40_2019_0.5_10.0.model \
  --output-image ./images/output-images/boys-19caffe-14.jpg \
  --cuda 0 \
  --output-size 1024


python neural_style/neural_style_vgg19_caffe.py eval \
  --content-image ./images/content-images/ostagram/content-23.jpg \
  --model ./saved_models/style-23/19_caffe_epoch_2_Tue_Dec_31_12:49:55_2019_0.5_1000.0.model \
  --output-image ./images/output-images/content-23-19caffe-7.jpg \
  --cuda 0 \
  --output-size 1024


python neural_style/neural_style_vgg19_caffe.py eval \
  --content-image ./images/content-images/ostagram/content-1.jpg \
  --model ./saved_models/style-1/19_caffe_epoch_2_Tue_Dec_31_10:36:04_2019_5.0_150.0.model \
  --output-image ./images/output-images/content-1-19caffe-10.jpg \
  --cuda 0 \
  --output-size 1024
