# Tubes-PCD
Repo berisi kode untuk pengklasifikasian gambar, Kode ini untuk memenuhi tuntutan tugas besar mata kuliah "Pengolahan Citra Digital".

### rename.py
fungsi dari file rename.py adalah untuk me-rename file gambar/data yang ada di folder terpisah. Tujuan mengapa file di rename, supaya untuk memudahkan membedakan file dan menghindari jika ada nama file yang sama (karena gambar diambil dari kamera hp yang berbeda-beda).

### split.py
fungsi dari file split.py adalah untuk mengambil file gambar di tiap kelas dan meletakkannya di folder Citra Latih dan Citra Uji. folder Citra Latih adalah dataset dimana akan di ekstrak fitur nya untuk pembuatan model, dan Citra Uji untuk keperluan testing. Pembagian dataset adalah 15 gambar untuk latih dan 5 gambar untuk uji.
