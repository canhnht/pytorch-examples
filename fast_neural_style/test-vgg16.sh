#!/bin/bash

python neural_style/neural_style.py eval \
  --content-image ./images/content-images/boys.jpg \
  --model ./saved_models/0035/19_epoch_2_Thu_Dec_26_11:56:03_2019_100000.0_10000000000.0.model \
  --output-image ./images/output-images/boys-16-0035-1.jpg \
  --cuda 0 \
  --output-size 1024 \
  --original-colors 0


python neural_style/neural_style.py eval \
  --content-image ./images/content-images/boys.jpg \
  --model ./saved_models/0004/19_epoch_2_Thu_Dec_26_11:42:54_2019_100000.0_10000000000.0.model \
  --output-image ./images/output-images/boys-16-0004-1.jpg \
  --cuda 0 \
  --output-size 1024 \
  --original-colors 0


python neural_style/neural_style.py eval \
  --content-image ./images/content-images/boys.jpg \
  --model ./saved_models/0030/19_epoch_2_Thu_Dec_26_12:36:52_2019_100000.0_10000000000.0.model \
  --output-image ./images/output-images/boys-16-0030-1.jpg \
  --cuda 0 \
  --output-size 1024 \
  --original-colors 0
