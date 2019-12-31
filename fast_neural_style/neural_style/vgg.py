from collections import namedtuple

import torch
from torchvision import models

from CaffeLoader import loadCaffemodel


"""
VGG16:
1	conv1_1
2	relu1_1
3	conv1_2
4	relu1_2
5	pool1
6	conv2_1
7	relu2_1
8	conv2_2
9	relu2_2
10	pool2
11	conv3_1
12	relu3_1
13	conv3_2
14	relu3_2
15	conv3_3
16	relu3_3
17	pool3
18	conv4_1
19	relu4_1
20	conv4_2
21	relu4_2
22	conv4_3
23	relu4_3
24	pool4
25	conv5_1
26	relu5_1
27	conv5_2
28	relu5_2
29	conv5_3
30	relu5_3
31	pool5
"""


class Vgg16(torch.nn.Module):
    def __init__(self, requires_grad=False):
        super(Vgg16, self).__init__()
        vgg_pretrained_features = models.vgg16(pretrained=True).features
        self.slice_relu1_2 = torch.nn.Sequential()
        self.slice_relu2_2 = torch.nn.Sequential()
        self.slice_relu3_3 = torch.nn.Sequential()
        self.slice_relu4_3 = torch.nn.Sequential()
        self.slice_relu5_3 = torch.nn.Sequential()
        print('vgg_pretrained_features', vgg_pretrained_features)
        for x in range(4):
            self.slice_relu1_2.add_module(str(x), vgg_pretrained_features[x])
        for x in range(4, 9):
            self.slice_relu2_2.add_module(str(x), vgg_pretrained_features[x])
        for x in range(9, 16):
            self.slice_relu3_3.add_module(str(x), vgg_pretrained_features[x])
        for x in range(16, 23):
            self.slice_relu4_3.add_module(str(x), vgg_pretrained_features[x])
        for x in range(23, 30):
            self.slice_relu5_3.add_module(str(x), vgg_pretrained_features[x])
        if not requires_grad:
            for param in self.parameters():
                param.requires_grad = False
        print('slice_relu1_2', self.slice_relu1_2)
        print('slice_relu2_2', self.slice_relu2_2)
        print('slice_relu3_3', self.slice_relu3_3)
        print('slice_relu4_3', self.slice_relu4_3)
        print('slice_relu5_3', self.slice_relu5_3)

    def forward(self, X):
        h = self.slice_relu1_2(X)
        h_relu1_2 = h
        h = self.slice_relu2_2(h)
        h_relu2_2 = h
        h = self.slice_relu3_3(h)
        h_relu3_3 = h
        h = self.slice_relu4_3(h)
        h_relu4_3 = h
        h = self.slice_relu5_3(h)
        h_relu5_3 = h
        vgg_outputs = namedtuple(
            "VggOutputs", ['relu1_2', 'relu2_2', 'relu3_3', 'relu4_3', 'relu5_3'])
        out = vgg_outputs(
            h_relu1_2,
            h_relu2_2,
            h_relu3_3,
            h_relu4_3,
            h_relu5_3,
        )
        return out


"""
VGG19:
1	conv1_1
2	relu1_1
3	conv1_2
4	relu1_2
5	pool1
6	conv2_1
7	relu2_1
8	conv2_2
9	relu2_2
10	pool2
11	conv3_1
12	relu3_1
13	conv3_2
14	relu3_2
15	conv3_3
16	relu3_3
17	conv3_4
18	relu3_4
19	pool3
20	conv4_1
21	relu4_1
22	conv4_2
23	relu4_2
24	conv4_3
25	relu4_3
26	conv4_4
27	relu4_4
28	pool4
29	conv5_1
30	relu5_1
31	conv5_2
32	relu5_2
33	conv5_3
34	relu5_3
35	conv5_4
36	relu5_4
37	pool5
"""


class Vgg19_Caffe(torch.nn.Module):
    def __init__(self, requires_grad=False):
        super(Vgg19_Caffe, self).__init__()
        vgg_pretrained_features = loadCaffemodel(
            model_file='./models/vgg19-d01eb7cb.pth',
            pooling='max',
            use_gpu='1',
            disable_check=False,
        ).features
        self.slice_relu1_1 = torch.nn.Sequential()
        self.slice_relu2_1 = torch.nn.Sequential()
        self.slice_relu3_1 = torch.nn.Sequential()
        self.slice_relu4_1 = torch.nn.Sequential()
        self.slice_relu4_2 = torch.nn.Sequential()
        self.slice_relu5_1 = torch.nn.Sequential()
        print('vgg_pretrained_features', vgg_pretrained_features)
        for x in range(2):
            self.slice_relu1_1.add_module(str(x), vgg_pretrained_features[x])
        for x in range(2, 7):
            self.slice_relu2_1.add_module(str(x), vgg_pretrained_features[x])
        for x in range(7, 12):
            self.slice_relu3_1.add_module(str(x), vgg_pretrained_features[x])
        for x in range(12, 21):
            self.slice_relu4_1.add_module(str(x), vgg_pretrained_features[x])
        for x in range(21, 23):
            self.slice_relu4_2.add_module(str(x), vgg_pretrained_features[x])
        for x in range(23, 30):
            self.slice_relu5_1.add_module(str(x), vgg_pretrained_features[x])
        if not requires_grad:
            for param in self.parameters():
                param.requires_grad = False

    def forward(self, X):
        h = self.slice_relu1_1(X)
        h_relu1_1 = h
        h = self.slice_relu2_1(h)
        h_relu2_1 = h
        h = self.slice_relu3_1(h)
        h_relu3_1 = h
        h = self.slice_relu4_1(h)
        h_relu4_1 = h
        h = self.slice_relu4_2(h)
        h_relu4_2 = h
        h = self.slice_relu5_1(h)
        h_relu5_1 = h
        style_output_gen = namedtuple(
            "Vgg19StyleOutput",
            [
                'relu1_1',
                'relu2_1',
                'relu3_1',
                'relu4_1',
                # 'relu5_1',
            ]
        )
        content_output_gen = namedtuple(
            "Vgg19ContentOutput",
            [
                'relu4_2',
            ]
        )
        style_output = style_output_gen(
            h_relu1_1,
            h_relu2_1,
            h_relu3_1,
            h_relu4_1,
            # h_relu5_1,
        )
        content_output = content_output_gen(
            h_relu4_2,
        )
        return style_output, content_output


class Vgg19(torch.nn.Module):
    def __init__(self, requires_grad=False):
        super(Vgg19, self).__init__()
        vgg_pretrained_features = models.vgg19(pretrained=True).features
        self.slice_relu1_1 = torch.nn.Sequential()
        self.slice_relu2_1 = torch.nn.Sequential()
        self.slice_relu3_1 = torch.nn.Sequential()
        self.slice_relu4_1 = torch.nn.Sequential()
        self.slice_relu4_2 = torch.nn.Sequential()
        self.slice_relu5_1 = torch.nn.Sequential()
        print('vgg_pretrained_features', vgg_pretrained_features)
        for x in range(2):
            self.slice_relu1_1.add_module(str(x), vgg_pretrained_features[x])
        for x in range(2, 7):
            self.slice_relu2_1.add_module(str(x), vgg_pretrained_features[x])
        for x in range(7, 12):
            self.slice_relu3_1.add_module(str(x), vgg_pretrained_features[x])
        for x in range(12, 21):
            self.slice_relu4_1.add_module(str(x), vgg_pretrained_features[x])
        for x in range(21, 23):
            self.slice_relu4_2.add_module(str(x), vgg_pretrained_features[x])
        for x in range(23, 30):
            self.slice_relu5_1.add_module(str(x), vgg_pretrained_features[x])
        if not requires_grad:
            for param in self.parameters():
                param.requires_grad = False
        print('slice_relu1_1', self.slice_relu1_1)
        print('slice_relu2_1', self.slice_relu2_1)
        print('slice_relu3_1', self.slice_relu3_1)
        print('slice_relu4_1', self.slice_relu4_1)
        print('slice_relu4_2', self.slice_relu4_2)
        print('slice_relu5_1', self.slice_relu5_1)

    def forward(self, X):
        h = self.slice_relu1_1(X)
        h_relu1_1 = h
        h = self.slice_relu2_1(h)
        h_relu2_1 = h
        h = self.slice_relu3_1(h)
        h_relu3_1 = h
        h = self.slice_relu4_1(h)
        h_relu4_1 = h
        h = self.slice_relu4_2(h)
        h_relu4_2 = h
        h = self.slice_relu5_1(h)
        h_relu5_1 = h
        style_output_gen = namedtuple(
            "Vgg19StyleOutput",
            [
                'relu1_1',
                'relu2_1',
                'relu3_1',
                'relu4_1',
                'relu5_1',
            ]
        )
        content_output_gen = namedtuple(
            "Vgg19ContentOutput",
            [
                'relu4_2',
            ]
        )
        style_output = style_output_gen(
            h_relu1_1,
            h_relu2_1,
            h_relu3_1,
            h_relu4_1,
            h_relu5_1,
        )
        content_output = content_output_gen(
            h_relu4_2,
        )
        return style_output, content_output
