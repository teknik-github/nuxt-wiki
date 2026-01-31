---
title: Apache2 SSL Configuration dengan CertBot
description: Panduan langkah demi langkah untuk mengkonfigurasi SSL pada server Apache2 menggunakan CertBot dari Let's Encrypt.
navigation:
  icon: simple-icons:apache
---


Untuk mengamankan website yang dihosting menggunakan Apache2, kita dapat menggunakan CertBot untuk mendapatkan dan menginstal SSL Certificate dari Let's Encrypt. Berikut adalah langkah-langkah untuk mengkonfigurasi SSL pada Apache2 menggunakan CertBot:

1. **Install CertBot dan Plugin Apache**
   Pertama, kita perlu menginstal CertBot dan plugin Apache untuk CertBot.
   ```bash
   sudo apt update
   sudo apt install certbot python3-certbot-apache -y
   ```

2. **Konfigurasi Virtual Host Apache**
   Pastikan Anda memiliki konfigurasi Virtual Host untuk domain Anda di Apache. Contoh konfigurasi:
   ```bash
   sudo nano /etc/apache2/sites-available/yourdomain.com.conf / 000-default.conf
   ```
   Masukkan konfigurasi berikut:
   ```apache
   <VirtualHost *:80>
       ServerName yourdomain.com
       ServerAlias www.yourdomain.com
       DocumentRoot /var/www/yourdomain.com / /var/www/html
       ErrorLog ${APACHE_LOG_DIR}/error.log
       CustomLog ${APACHE_LOG_DIR}/access.log combined
    </VirtualHost>
    ```
>Note: Jika sudah ada file konfigurasi Virtual Host, tambahkan hanya bagian `ServerName`, `ServerAlias`, dan `DocumentRoot` sesuai kebutuhan Anda.

    Ganti `yourdomain.com` dengan nama domain Anda dan `/var/www/yourdomain.com` dengan direktori root web Anda.
    Simpan dan keluar dari editor.

3. **Aktifkan Virtual Host**
   Aktifkan konfigurasi Virtual Host yang baru saja dibuat:
   ```bash
   sudo a2ensite yourdomain.com.conf / 000-default.conf
   sudo systemctl reload apache2
   ```

4. **Dapatkan SSL Certificate dengan CertBot**
   Jalankan perintah berikut untuk mendapatkan SSL Certificate dari Let's Encrypt:
   ```bash
   sudo certbot --apache -d yourdomain.com
    ```
    Ikuti petunjuk di layar untuk menyelesaikan proses verifikasi dan instalasi SSL.
    CertBot akan secara otomatis mengkonfigurasi Apache untuk menggunakan SSL.

5. **Verifikasi Instalasi SSL**
    Setelah proses selesai, Anda dapat memverifikasi bahwa SSL telah diinstal dengan benar dengan mengunjungi situs Anda menggunakan `https://yourdomain.com`.
    Anda juga dapat menggunakan alat online seperti [SSL Labs](https://www.ssllabs.com/ssltest/) untuk memeriksa konfigurasi SSL Anda.

6. **Perbarui SSL Certificate Secara Otomatis**
   CertBot secara otomatis mengatur pembaruan SSL Certificate. Namun, Anda dapat menguji pembaruan otomatis dengan menjalankan:
   ```bash
   sudo certbot renew --dry-run
   ```
Dengan mengikuti langkah-langkah di atas, Anda telah berhasil mengkonfigurasi SSL pada Apache2 menggunakan CertBot. Website Anda sekarang aman dengan HTTPS!