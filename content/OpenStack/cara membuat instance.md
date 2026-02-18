---
title: Cara Membuat Instance di OpenStack
description: Panduan langkah demi langkah tentang cara membuat instance (mesin virtual) di OpenStack.
navigation: 
  icon: mdi:cloud
---


Kenalan sedikit dengan OpenStack? Salah satu hal dasar yang perlu Anda ketahui adalah cara membuat instance (mesin virtual) di OpenStack. Berikut adalah langkah-langkah untuk membuat instance di OpenStack:

## Langkah 1: Masuk ke Dashboard OpenStack
1. Buka browser web Anda dan masuk ke dashboard OpenStack menggunakan URL yang diberikan oleh administrator Anda.
2. Masukkan nama pengguna dan kata sandi Anda untuk masuk.

## Langkah 2: Navigasi ke Bagian Instances
1. Setelah masuk, navigasikan ke menu "Compute" atau "Instances" di dashboard.
2. Klik pada opsi "Instances" untuk melihat daftar instance yang ada.

## Langkah 3: Buat Instance Baru
1. Klik tombol "Launch Instance" atau "Create Instance" untuk memulai proses pembuatan instance baru.
2. Isi formulir pembuatan instance dengan informasi berikut:
   - **Name**: Beri nama untuk instance Anda.
   - **Source**: Pilih sumber untuk instance Anda, seperti image atau snapshot.
   - **Flavor**: Pilih flavor yang sesuai dengan kebutuhan sumber daya instance Anda (CPU, RAM, disk).
   - **Networks**: Pilih jaringan yang akan digunakan oleh instance.
   - **Security Groups**: Pilih grup keamanan yang sesuai untuk instance Anda.

## Langkah 4: Konfigurasi Opsi Tambahan
1. Anda dapat mengkonfigurasi opsi tambahan seperti:
   - **Key Pair**: Pilih atau buat pasangan kunci SSH untuk mengakses instance.
   - **User Data**: Tambahkan skrip inisialisasi jika diperlukan.
   - **Metadata**: Tambahkan metadata khusus untuk instance Anda.

## Langkah 5: Launch Instance
1. Setelah mengisi semua informasi yang diperlukan, klik tombol "Launch" atau "Create" untuk membuat instance.
2. Tunggu beberapa saat hingga instance selesai dibuat dan statusnya berubah menjadi "Active".

## Langkah 6: Akses Instance
1. Setelah instance aktif, Anda dapat mengaksesnya menggunakan SSH (jika Anda telah mengatur pasangan kunci) atau metode lain yang sesuai.
2. Gunakan alamat IP yang diberikan untuk mengakses instance Anda.

Itulah cara membuat instance di OpenStack. Jika Anda mengalami masalah atau memiliki pertanyaan lebih lanjut, jangan ragu untuk menghubungi administrator OpenStack Anda atau merujuk ke dokumentasi resmi OpenStack. Selamat mencoba!