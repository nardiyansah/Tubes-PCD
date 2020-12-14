import os
import random
from shutil import copyfile

# mendapatkan current direktori
cwd = os.getcwd()

# list nama folder berisi data gambar
list_folder = [
    "Daun_Cocor_Bebek",
    "Daun_Jambu",
    "Daun_Kacang_Panjang",
    "Daun_singkong",
    "Daun_Tomat",
]

# membuat dir Citra Latih dan Citra Uji
os.mkdir(os.path.join(cwd, "Dataset"))
# membuat path dir Citra Latih dan Citra Uji
dir_dataset = os.path.join(cwd, "Dataset")

# iterasi setiap folder
for folder in list_folder:
    # path folder
    path_folder = os.path.join(cwd, folder)
    # mendapatkan list file
    list_file = os.listdir(path_folder)
    # ambil 20 file random
    sample = random.sample(list_file, 20)
    for file in sample:
        # copy file ke folder Dataset
        copyfile(os.path.join(path_folder, file), os.path.join(dir_dataset, file))
