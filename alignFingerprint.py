from PIL import Image
import numpy as np
from os import listdir
from os.path import join

root = 'FingerprintImages'
images = listdir(root)

image = np.array(Image.open(join(root, images[0])))

[rows, cols] = image.shape
i = np.array([[x, y] for x in range(rows - 1) for y in range(cols - 1) if image[x, y] < 230])

i_m = np.subtract(i, np.mean(i))

cov = np.matmul(np.transpose(i_m), i_m)

u, s, v = np.linalg.svd(cov)

x = 0
