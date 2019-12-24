#!/bin/bash

# python neural_style/neural_style_vgg19.py eval \
#   --content-image ./images/content-images/content-1.jpg \
#   --model ./saved_models/style-1/19_epoch_2_Fri_Dec_20_14:14:39_2019_0.5_1000.0.model \
#   --output-image ./images/output-images/content1-19-1.jpg \
#   --cuda 0 \
#   --output-size 512


python neural_style/neural_style_vgg19.py eval \
  --content-image ./images/content-images/brad_pitt.jpg \
  --model ./saved_models/style-6/19_epoch_2_Fri_Dec_20_14:26:53_2019_0.05_0.5.model \
  --output-image ./images/output-images/brad_pitt-19-1.jpg \
  --cuda 0 \
  --output-size 1024
