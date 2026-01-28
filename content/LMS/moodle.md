---
title: "Moodle LMS"
description: Panduan lengkap tentang cara menginstal dan menggunakan Moodle LMS untuk pembelajaran daring.
navigation: 
  icon: devicon-plain:moodle
---

# Moodle LMS

Moodle adalah platform pembelajaran daring (Learning Management System/LMS) yang banyak digunakan di institusi pendidikan untuk mengelola kursus, materi pembelajaran, dan interaksi antara pengajar dan siswa. Moodle bersifat open-source dan dapat disesuaikan sesuai kebutuhan pengguna.

## Fitur Utama Moodle
- **Manajemen Kursus**: Membuat, mengelola, dan mengatur kursus secara efisien.
- **Interaksi Pengguna**: Forum diskusi, pesan pribadi, dan kolaborasi antar pengguna.
- **Penilaian dan Umpan Balik**: Sistem penilaian otomatis, kuis, dan tugas.
- **Pelaporan dan Analitik**: Melacak kemajuan siswa dan kinerja kursus.
- **Integrasi Plugin**: Mendukung berbagai plugin untuk menambah fungsionalitas.

## Instalasi Moodle di Server Linux
1. **Persiapan Server**
   Pastikan server Anda memiliki LAMP stack (Linux, Apache, MySQL, PHP) terinstal dan dikonfigurasi dengan benar.
   Sebelum itu kita akan menggunakan script otomatis untuk instalasi LAMP stack dan Moodle
   ```bash
   wget -O install_moodle.sh https://raw.githubusercontent.com/teknik-github/moodle-auto/refs/heads/main/install.sh && bash install_moodle.sh
   ``` 
   Tunggu sampai proses instalasi selesai

2. **Moodle Setup**
    Setelah instalasi selesai, buka browser dan akses Moodle melalui domain atau IP server Anda. Ikuti panduan setup untuk mengkonfigurasi pengaturan awal moodle.

![](https://cdn.peceldev.my.id/images/1763519171978-2vr5xi.webp)

Nah begitulah cara instalasi Moodle LMS menggunakan script otomatis. Setelah setup awal selesai, Anda dapat mulai menambahkan kursus, pengguna, dan konten pembelajaran sesuai kebutuhan Anda.