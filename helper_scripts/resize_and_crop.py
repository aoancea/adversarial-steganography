
"""
Crop and resize all images in folder to given size
"""
import os
from glob import glob
from PIL import Image


import sys
sys.path.append('../')

from nn.image_utils import transform, imread, center_crop
import scipy.misc
from scipy.misc import imsave

img_dir = '/home/dvolkhonskiy/datasets/stego_celeb/lsb_matching_train'
ext = '*.png'


def main():
    img_list = glob(os.path.join(img_dir, ext))

    for i, img in enumerate(img_list):
        print('Processing %s' % img)

        if 'stego_' in os.path.split(img)[-1]:
            os.remove(img)
            continue

        imsave(img, center_crop(imread(img), 64))

        if i % 100 == 0:
            print('Processed %s from %s' % (i, len(img_list)))


if __name__ == '__main__':
    main()
