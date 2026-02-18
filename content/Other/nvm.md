---
title: NVM
description: Cara menginstall dan menggunakan nvm untuk mengelola versi Node.js
navigation:
  icon: simple-icons:nvm
---

# NVM (Node Version Manager)
NVM (Node Version Manager) adalah alat yang memungkinkan Anda untuk mengelola beberapa versi Node.js di satu sistem. Dengan NVM, Anda dapat dengan mudah menginstal, menghapus, dan beralih antara berbagai versi Node.js sesuai kebutuhan proyek Anda.

## Cara Menginstal NVM
Untuk menginstal NVM, Anda dapat menggunakan perintah berikut di terminal Anda:
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
```
Atau, jika Anda menggunakan `wget`:
```bash
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
```

Setelah instalasi selesai, tutup dan buka kembali terminal Anda, atau jalankan perintah berikut untuk memuat NVM:
```bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
```

## Cara Menggunakan NVM
Berikut adalah beberapa perintah dasar untuk menggunakan NVM:
1. **Menginstal Versi Node.js**:
   ```bash
   nvm install <version>
   ```
   Contoh:
   ```bash
   nvm install 14.17.0
   ```
2. **Menggunakan Versi Node.js Tertentu**:
   ```bash
   nvm use <version>
   ```
   Contoh:
   ```bash
   nvm use 14.17.0
   ```
3. **Menampilkan Versi Node.js yang Terinstal**:
   ```bash
   nvm ls
   ```
4. **Menampilkan Versi Node.js yang Tersedia untuk Diinstal**:
   ```bash
   nvm ls-remote
   ```
5. **Menghapus Versi Node.js**:
   ```bash
   nvm uninstall <version>
   ```
   Contoh:
   ```bash
   nvm uninstall 14.17.0
   ```

## Kesimpulan
NVM adalah alat yang sangat berguna bagi pengembang yang bekerja dengan berbagai proyek Node.js yang memerlukan versi Node.js yang berbeda. Dengan NVM, Anda dapat dengan mudah mengelola versi Node.js dan memastikan bahwa proyek Anda berjalan dengan versi yang tepat. Untuk informasi lebih lanjut, kunjungi [situs resmi NVM](https://github.com/nvm-sh/nvm).