---
title: LEMP
description: Apa itu LEMP? dan bagaimana cara menginstalnya.
navigation: 
  icon: mdi:server
---

# Apa itu LEMP?
LEMP adalah singkatan dari Linux, Nginx (diucapkan "Engine-X"), MySQL/MariaDB, dan PHP. Ini adalah stack perangkat lunak yang umum digunakan untuk menghosting aplikasi web dinamis. Setiap komponen dalam LEMP memiliki peran penting:
- **Linux**: Sistem operasi open-source yang menjadi dasar dari stack ini.
- **Nginx**: Server web yang bertanggung jawab untuk menangani permintaan HTTP dan menyajikan konten web kepada pengguna.
- **MySQL/MariaDB**: Sistem manajemen basis data yang digunakan untuk menyimpan dan mengelola data aplikasi web.
- **PHP**: Bahasa pemrograman server-side yang digunakan untuk mengembangkan aplikasi web dinamis.

## Kegunaan LEMP
LEMP digunakan untuk mengembangkan dan menghosting berbagai jenis aplikasi web, mulai dari situs web sederhana hingga aplikasi web kompleks. Beberapa kegunaan utama LEMP meliputi:
- **Pengembangan Aplikasi Web**: LEMP menyediakan lingkungan yang ideal untuk mengembangkan aplikasi web menggunakan PHP dan basis data MySQL/MariaDB.
- **Hosting Situs Web**: Banyak penyedia hosting web menggunakan LEMP sebagai platform untuk menyajikan situs web kepada pengguna.
- **Manajemen Konten**: LEMP sering digunakan untuk menghosting sistem manajemen konten (CMS) seperti WordPress, Joomla, dan Drupal.
- **E-commerce**: Banyak platform e-commerce, seperti Magento dan WooCommerce, berjalan di atas stack LEMP.

## Komponen LEMP
### Linux
Linux adalah sistem operasi open-source yang menjadi dasar dari stack LEMP. Ada berbagai distribusi Linux yang dapat digunakan, seperti Ubuntu, CentOS, dan Debian. 

### Instalasi
1. Install web server Nginx
```bash
apt update && apt install -y nginx
```

2. Tambah kan repository PHP
```bash
add-apt-repository ppa:ondrej/php -y
apt update
```

3. install extensi PHP (tambahkan jika tidak ada)
```bash
apt install -y php8.2 php8.2-{cli,fpm,common,gd,mbstring,mysql,xml,xmlrpc,soap,intl,zip,curl,opcache}
```

4. Install tambahkan repo database (Mariadb)
```bash
curl -LsS https://r.mariadb.com/downloads/mariadb_repo_setup | sudo bash
```

5. Install Mariadb server
```bash
apt update && apt install -y mariadb-server mariadb-client
```

6. Amankan instalasi database
```bash
mysql_secure_installation
```

7. Konfigurasi PHP-FPM untuk Nginx
   Buka file konfigurasi PHP-FPM, biasanya terletak di `/etc/php/8.2/fpm/pool.d/www.conf`, dan pastikan baris berikut diatur dengan benar:
```ini
listen = /run/php/php8.2-fpm.sock
```

8. Restart layanan PHP-FPM
```bash
systemctl restart php8.2-fpm
```

## Konfigurasi LEMP
Setelah menginstal semua komponen LEMP, Anda perlu melakukan beberapa konfigurasi dasar untuk memastikan semuanya berjalan dengan baik.
1. **Konfigurasi Nginx**: Anda dapat menyesuaikan konfigurasi Nginx dengan mengedit file konfigurasi di `/etc/nginx/nginx.conf` atau menambahkan file konfigurasi server block di `/etc/nginx/sites-available/`.
2. **Konfigurasi PHP**: Anda dapat menyesuaikan pengaturan PHP dengan mengedit file `php.ini`, yang biasanya terletak di `/etc/php/8.2/fpm/php.ini`.
3. **Konfigurasi MySQL/MariaDB**: Anda dapat mengelola basis data dan pengguna MySQL/MariaDB menggunakan perintah SQL melalui antarmuka baris perintah MySQL atau alat manajemen basis data seperti phpMyAdmin.
4. **Konfigurasi Nginx untuk PHP**: Pastikan untuk mengonfigurasi Nginx agar dapat memproses file PHP dengan menambahkan blok lokasi di dalam server block Anda:
```nginx
location ~ \.php$ {
    include snippets/fastcgi-php.conf;
    fastcgi_pass unix:/run/php/php8.2-fpm.sock;
}
```

3. Restart layanan Nginx
```bash
systemctl restart nginx
```

