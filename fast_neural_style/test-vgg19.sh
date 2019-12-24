#!/bin/bash

# python neural_style/neural_style_vgg19.py eval \
#   --content-image ./images/content-images/content-1.jpg \
#   --model ./saved_models/style-1/epoch_2_Thu_Dec_19_16:16:40_2019_100000.0_10000000000.0.model \
#   --output-image ./images/output-images/output-2.jpg \
#   --cuda 0 \
#   --output-size 512 \
#   --original-colors 0


python neural_style/neural_style.py eval \
  --content-image ./images/content-images/content-5.jpg \
  --model ./saved_models/style-6/19_epoch_2_Fri_Dec_20_16:14:10_2019_100000.0_10000000000.0.model \
  --output-image ./images/output-images/content5-16-1.jpg \
  --cuda 0 \
  --output-size 512

