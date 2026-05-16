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

- get
- http
- hive
- hive_flutter
- shared_preferences

---

## Struktur Folder

```bash
lib/
├── main.dart
├── models/
│   └── cart_model.dart
│
├── pages/
│   ├── splash_page.dart
│   ├── login_page.dart
│   ├── main_navigation.dart
│   ├── home_page.dart
│   ├── detail_page.dart
│   ├── cart_page.dart
│   └── profile_page.dart
│
├── services/
│   └── api_service.dart
