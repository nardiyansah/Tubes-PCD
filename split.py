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
os.mkdir(os.path.join(cwd, "Citra Latih"))
os.mkdir(os.path.join(cwd, "Citra Uji"))
# membuat path dir Citra Latih dan Citra Uji
dir_latih = os.path.join(cwd, "Citra Latih")
dir_uji = os.path.join(cwd, "Citra Uji")

# iterasi setiap folder
for folder in list_folder:
    # path folder
    path_folder = os.path.join(cwd, folder)
    # mendapatkan list file
    list_file = os.listdir(path_folder)
    # ambil 20 file random
    sample = random.sample(list_file, 20)
    # ambil 15 file random untuk ditempat kan di dir Citra Latih
    file_latih = random.sample(sample, 15)
    for file in sample:
        # cek jika di file ada di file_latih, copy ke citra latih
        if file in file_latih:
            copyfile(os.path.join(path_folder, file), os.path.join(dir_latih, file))
        # jika tidak copy ke citra uji
        else:
            copyfile(os.path.join(path_folder, file), os.path.join(dir_uji, file))
