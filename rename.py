import os

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

# list nama file baru untuk tiap folder
list_name = ["Cocor-Bebek", "Jambu", "Kacang-Panjang", "Singkong", "Tomat"]
# index untuk list name
i_name = 0

# iterasi setiap folder
for folder in list_folder:
    # membuat path folder
    path_dir = os.path.join(cwd, folder)
    # list nama file di dalam folder
    list_file = os.listdir(path_dir)
    # merename semua file dalam dir
    i = 1
    for file in list_file:
        os.rename(
            os.path.join(path_dir, file),
            os.path.join(path_dir, list_name[i_name] + "-" + str(i) + ".jpg"),
        )
        i = i + 1
    i_name = i_name + 1
