#!/bin/bash

# python neural_style/neural_style.py eval \
#   --content-image ./images/content-images/boys.jpg \
#   --model ./saved_models/style-5/19_epoch_2_Fri_Dec_20_17:18:09_2019_100000.0_10000000000.0.model \
#   --output-image ./images/output-images/boys-style-5-16-1.jpg \
#   --cuda 0 \
#   --output-size 1024 \
#   --original-colors 0


# python neural_style/neural_style.py eval \
#   --content-image ./images/content-images/boys.jpg \
#   --model ./saved_models/style-7/19_epoch_2_Fri_Dec_20_17:23:59_2019_100000.0_10000000000.0.model \
#   --output-image ./images/output-images/boys-style-7-16-1.jpg \
#   --cuda 0 \
#   --output-size 1024 \
#   --original-colors 0


python neural_style/neural_style.py eval \
  --content-image ./images/content-images/content-23.jpg \
  --model ./saved_models/style-23/19_epoch_2_Fri_Dec_20_17:19:23_2019_100000.0_10000000000.0.model \
  --output-image ./images/output-images/content-23-style-23-16-1.jpg \
  --cuda 0 \
  --output-size 1024

