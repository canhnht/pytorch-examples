#!/bin/sh

FAST_PYTORCH_PATH=/home/acworks/Documents/projects/style-transfer/ac-style-transfer/app/server/static/models/style-pytorch

cp ./saved_models/0037/19_caffe_epoch_2_Fri_Jan__3_18:06:31_2020_5.0_100.0.model /home/acworks/Documents/projects/style-transfer/ac-style-transfer/app/server/static/models/style-pytorch/0037-vgg19.model


scp -v ./saved_models/0005/19_caffe_epoch_2_Thu_Jan__2_12:30:04_2020_5.0_100.0.model ai-lab-1:/home/acworks/Documents/projects/style-transfer/ac-style-transfer/app/server/static/models/style-pytorch/0005-vgg19.model


cp ./images/style-images/photoac/*.jpg /home/acworks/Documents/projects/style-transfer/ac-style-transfer/app/server/static/models/style-pytorch
