from os import listdir, makedirs
from os.path import isfile, join, exists
from shutil import copy
import re

path = '../socofing/Altered/Altered-Easy/'
all_files = listdir(path)

match_zcut = re.compile('.*Right_thumb.*Zcut')
match_oblit = re.compile('.*Right_thumb.*Obl')
match_cr = re.compile('.*Right_thumb.*CR')

zcut = [join(path, f) for f in all_files if isfile(join(path, f)) and match_zcut.match(f)]
oblit = [join(path, f) for f in all_files if isfile(join(path, f)) and match_oblit.match(f)]
cr = [join(path, f) for f in all_files if isfile(join(path, f)) and match_cr.match(f)]

root_dir = 'TestFingerprints/'
if not exists(root_dir):
    makedirs(root_dir)

z_cut_dir = join(root_dir, 'ZCut')
if not exists(z_cut_dir):
    makedirs(z_cut_dir)

oblit_dir = join(root_dir, 'Obliterated')
if not exists(oblit_dir):
    makedirs(oblit_dir)

central_rotate_dir = join(root_dir, 'CentralRotate')
if not exists(central_rotate_dir):
    makedirs(central_rotate_dir)

for f in zcut:
    copy(f, z_cut_dir)

for f in oblit:
    copy(f, oblit_dir)

for f in cr:
    copy(f, central_rotate_dir)
