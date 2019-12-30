#!/bin/bash

python neural_style/neural_style_vgg19_caffe.py eval \
  --content-image ./images/content-images/content-1.jpg \
  --model ./saved_models/0030/19_caffe_epoch_2_Mon_Dec_30_14:31:20_2019_50.0_10000.0.model \
  --output-image ./images/output-images/content-1-19caffe-6.jpg \
  --cuda 0 \
  --output-size 1024


python neural_style/neural_style_vgg19_caffe.py eval \
  --content-image ./images/content-images/boys.jpg \
  --model ./saved_models/0030/19_caffe_epoch_2_Mon_Dec_30_15:56:50_2019_20.0_1000.0.model \
  --output-image ./images/output-images/boys-19caffe-5.jpg \
  --cuda 0 \
  --output-size 1024


python neural_style/neural_style_vgg19_caffe.py eval \
  --content-image ./images/content-images/boys.jpg \
  --model ./saved_models/0004/19_caffe_epoch_2_Thu_Dec_26_11:06:28_2019_1.0_1.0.model \
  --output-image ./images/output-images/boys-19caffe-2.jpg \
  --cuda 0 \
  --output-size 1024


python neural_style/neural_style_vgg19_caffe.py eval \
  --content-image ./images/content-images/ostagram/content-1.jpg \
  --model ./saved_models/style-1/19_caffe_epoch_2_Mon_Dec_30_15:58:35_2019_100.0_4000.0.model \
  --output-image ./images/output-images/content-1-19caffe-2.jpg \
  --cuda 0 \
  --output-size 1024
