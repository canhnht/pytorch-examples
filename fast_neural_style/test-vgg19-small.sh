#!/bin/bash

python neural_style/neural_style_vgg19_small.py eval \
  --content-image ./images/content-images/content-1.jpg \
  --model ./saved_models/0030/19_small_epoch_2_Wed_Jan__8_12:39:33_2020_5.0_100.0.model \
  --output-image ./images/output-images/content-1-19small-1.jpg \
  --cuda 0 \
  --output-size 1024


python neural_style/neural_style_vgg19_small.py eval \
  --content-image ./images/content-images/boys.jpg \
  --model ./saved_models/style-6/19_caffe_epoch_2_Tue_Dec_31_12:55:40_2019_0.5_10.0.model \
  --output-image ./images/output-images/boys-19caffe-14.jpg \
  --cuda 0 \
  --output-size 1024


python neural_style/neural_style_vgg19_small.py eval \
  --content-image ./images/content-images/ostagram/content-3.jpg \
  --model ./saved_models/candy/19_caffe_epoch_2_Tue_Dec_31_16:25:46_2019_50.0_1000.0.model \
  --output-image ./images/output-images/content-3-19caffe-2.jpg \
  --cuda 0 \
  --output-size 1024


python neural_style/neural_style_vgg19_small.py eval \
  --content-image ./images/content-images/ostagram/content-1.jpg \
  --model ./saved_models/style-1/19_caffe_epoch_2_Tue_Dec_31_10:36:04_2019_5.0_150.0.model \
  --output-image ./images/output-images/content-1-19caffe-10.jpg \
  --cuda 0 \
  --output-size 1024


# ./saved_models/rain-princess/19_caffe_epoch_2_Tue_Dec_31_15:11:36_2019_0.5_10.0.model
# ./saved_models/candy/19_caffe_epoch_2_Tue_Dec_31_15:13:43_2019_0.5_10.0.model


aws s3 cp ./saved_models/0004/19_small_epoch_2_Thu_Jan__9_15:09:46_2020_0.5_20.0.model s3://ac-style-transfer/models/0004-vgg19-small.model --acl public-read
