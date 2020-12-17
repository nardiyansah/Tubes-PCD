# Tubes-PCD
Repo berisi kode untuk pengklasifikasian gambar, Kode ini untuk memenuhi tuntutan tugas besar mata kuliah "Pengolahan Citra Digital".

### rename.py
fungsi dari file rename.py adalah untuk me-rename file gambar/data yang ada di folder terpisah. Tujuan mengapa file di rename, supaya untuk memudahkan membedakan file dan menghindari jika ada nama file yang sama (karena gambar diambil dari kamera hp yang berbeda-beda).

### split.py
fungsi dari file split.py adalah untuk mengambil file gambar di tiap kelas dan meletakkannya di folder 'Dataset'. file yang diambil sebanyak 20 buah untuk setiap kelas.

## Fitur
Fitur yang diekstrak dari dataset adalah :
- area
- eccentricity
- perimeter
- metric
- nilai kanal Green

### ekstrak_fitur.m
ekstrak_fitur.m adalah file yang berisi script matlab. Digunakan untuk melakukan image processing dan mengkstrak fitur dari dataset.

### klasifikasi.ipynb
Klasifikasi menggunakan KNN dengan jumlah tetangga 7
