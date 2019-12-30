import torch
import torchvision.transforms as transforms
from PIL import Image


def load_image(filename, size=None, scale=None):
    img = Image.open(filename).convert('RGB')
    if size is not None:
        img.thumbnail((size, size), Image.ANTIALIAS)
    elif scale is not None:
        img = img.resize(
            (int(img.size[0] / scale), int(img.size[1] / scale)), Image.ANTIALIAS)
    return img


def save_image(
        filename,
        data,
        original_colors,
        content_image_input):
    img = data.clone().clamp(0, 255).numpy()
    img = img.transpose(1, 2, 0).astype("uint8")
    img = Image.fromarray(img)
    if original_colors:
        img = convert_original_colors(content_image_input, img)
    img.save(filename)


def deprocess(output_tensor):
    print('deprocess', output_tensor)
    Normalize = transforms.Compose([transforms.Normalize(
        mean=[-103.939, -116.779, -123.68], std=[1, 1, 1])])
    bgr2rgb = transforms.Compose(
        [transforms.Lambda(lambda x: x[torch.LongTensor([2, 1, 0])])])
    Unloader = transforms.Compose([
        transforms.Lambda(lambda x: x.div(256))])
    output_tensor = Unloader(
        bgr2rgb(Normalize(output_tensor.squeeze(0).cpu())))
    output_tensor.clamp_(0, 1)
    print('output_tensorrrrrrr', output_tensor)
    Image2PIL = transforms.ToPILImage()
    image = Image2PIL(output_tensor.cpu())
    return image


def save_image_vgg19(
        filename,
        data,
        original_colors,
        content_image_input):
    img = deprocess(data)
    if original_colors:
        img = convert_original_colors(content_image_input, img)
    img.save(filename)


def gram_matrix(y):
    (b, ch, h, w) = y.size()
    features = y.view(b, ch, w * h)
    features_t = features.transpose(1, 2)
    gram = features.bmm(features_t) / (ch * h * w)
    return gram


def normalize_batch(batch):
    # normalize using imagenet mean and std
    mean = batch.new_tensor([0.485, 0.456, 0.406]).view(-1, 1, 1)
    std = batch.new_tensor([0.229, 0.224, 0.225]).view(-1, 1, 1)
    batch = batch.div_(255.0)
    return (batch - mean) / std


# Combine the Y channel of the generated image and the UV/CbCr channels of the
# content image to perform color-independent style transfer.
def convert_original_colors(content, generated):
    content_channels = list(content.convert('YCbCr').split())
    generated_channels = list(generated.convert('YCbCr').split())
    content_channels[0] = generated_channels[0]
    return Image.merge('YCbCr', content_channels).convert('RGB')
