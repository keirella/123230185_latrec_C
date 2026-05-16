# Flutter Online Shop App

Aplikasi toko online sederhana berbasis Flutter yang menggunakan API eksternal dari DummyJSON.  
Aplikasi ini dibuat untuk latihan Responsi IF-C.

## Fitur Aplikasi

- Login menggunakan username dan password NIM
- Session login menggunakan SharedPreferences
- Splash Screen
- Bottom Navigation Bar
- Menampilkan produk dari API eksternal
- Search produk
- Detail produk
- Add to Cart
- Cart berdasarkan user login
- Penyimpanan cart menggunakan Hive Database
- Hapus item cart
- Total harga cart
- Responsive UI
- Logout

---

## API

API yang digunakan:

https://dummyjson.com/products

---

## Library yang Digunakan

- get                   : Digunakan untuk manajemen navigasi (pindah halaman) dan memunculkan snackbar pemberitahuan
- http                  : Digunakan sebagai HTTP client untuk menembak URL API dan mengambil data produk mentah (JSON).
- hive & hive_flutter   : Database NoSQL lokal yang sangat ringan untuk menyimpan barang-barang di keranjang belanja secara permanen.
- shared_preferences    : Digunakan untuk menyimpan session login sederhana berupa string username di memori internal HP.

---

## Struktur Folder

```bash
lib/
├── main.dart                   # Untuk masuk kedalam aplikasi & inisialisasi awal database
├── models/
│   └── cart_model.dart         # Model Hive Adapter untuk mendefinisikan objek barang belanjaan
│
├── pages/
│   ├── splash_page.dart        # Halaman awal untuk mengecek status login user secara otomatis
│   ├── login_page.dart         # Halaman masuk sistem (wajib menggunakan password berupa NIM)
│   ├── main_navigation.dart    # Container menu bawah (Bottom Navigation) untuk menyatukan halaman
│   ├── home_page.dart          # Halaman utama untuk melihat katalog dan mencari produk
│   ├── detail_page.dart        # Halaman untuk melihat detail barang dan memasukkannya ke keranjang
│   ├── cart_page.dart          # Halaman keranjang belanja spesifik milik user yang sedang aktif
│   └── profile_page.dart       # Halaman informasi akun pengguna sekaligus tombol keluar (logout)
│
├── services/
│   └── api_service.dart        # Berisi fungsi HTTP untuk mengambil (fetch) data produk dari API
