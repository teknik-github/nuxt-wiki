# Cara order Neo Virtual Compute (NVC)
Apa itu Neo Virtual Compute (NVC)?
Neo Virtual Compute (NVC) adalah layanan komputasi awan yang disediakan oleh Biznet Gio Cloud, yang memungkinkan pengguna untuk menjalankan aplikasi dan layanan mereka di lingkungan virtual yang skalabel dan fleksibel.

## Langkah-langkah untuk melakukan order NVC
1. **Kunjungi Situs Biznet Gio Cloud**
   Buka browser web Anda dan kunjungi situs resmi Biznet Gio Cloud di [https://biznetgio.com](https://biznetgio.com).

2. **Order Layanan NVC**
   - Pilih menu "Compute" dan klik "Neo Virtual Compute" lalu "Create New".
![Image](https://cdn.peceldev.my.id/images/1760867006474-wqxilc.webp)
   - Berikan nama untuk instance NVC Anda pada kolom "Virtual Compute Name".
   - Pilih "Region" sesuai kebutuhan Anda.
   - Pilih "Zone" yang diinginkan.
   - Pilih "Image" yang sesuai dengan sistem operasi yang Anda inginkan.
   - Pilih "Flavor" dan "Billing Cycle" sesuai dengan kebutuhan Anda.
![Image](https://cdn.peceldev.my.id/images/1760867332832-kizhzo.webp)

3. **Konfigurasi NVC**
   - Pilih "Create Key Pair" untuk membuat pasangan kunci SSH.
![Image](https://cdn.peceldev.my.id/images/1760867841476-p7z7s.webp)

>Note: Simpan pasangan kunci SSH Anda dengan aman, karena Anda akan membutuhkannya untuk mengakses instance NVC Anda.

   - Buat "Network" untuk instance NVC Anda.
![Image](https://cdn.peceldev.my.id/images/1760868988963-m37nr.webp)

   - Berikan nama untuk "Subnet" dan atur "CIDR" sesuai kebutuhan Anda.
![Image](https://cdn.peceldev.my.id/images/1760869453729-ehmh6q.webp)

   - Setelah itu buat "Router" lalu pilih "Public Network" sebagai gateway dan "Billing Cycle" (Setiap region terdapat free 1 Router).
![Image](https://cdn.peceldev.my.id/images/1760870021186-ddrlx.webp)

   - "Security Group" akan di gunakan untuk mengatur aturan firewall pada instance NVC Anda. Pilih "Add" dan atur aturan sesuai kebutuhan Anda.
![Image](https://cdn.peceldev.my.id/images/1760871284059-fvzqj.webp)

   - "Floating IP" adalah alamat IP publik yang dapat Anda gunakan untuk mengakses instance NVC Anda dari internet. Pilih "Add" untuk mendapatkan Floating IP.
![Image](https://cdn.peceldev.my.id/images/1760871790155-j3664.webp)
> Note: Pada setiap region terdapat free 1 Floating IP.

![Image](https://cdn.peceldev.my.id/images/1760871928552-am9qyd.webp)

Setelah semua konfigurasi selesai, klik "Next" untuk melakukan review order Anda. Jika semua informasi sudah benar, klik "Order" untuk menyelesaikan proses order NVC Anda.

4. **Cara Connect ke Instance NVC**
    - Lakukan configurasi security group untuk mengizinkan akses SSH (port 22) dari IP Anda.
![Image](https://cdn.peceldev.my.id/images/1760872457532-mcrcnn.webp)
    - Pada inbound rules, pilih "SSH" dan pada "IP Prefix" masukkan IP Anda atau berikan 0.0.0.0/0 untuk mengizinkan akses dari semua IP lalu "Add".
![Image](https://cdn.peceldev.my.id/images/1760872680670-maouka.webp)
    - Gunakan terminal atau aplikasi SSH client seperti PuTTY untuk mengakses instance NVC Anda.
![Image](https://cdn.peceldev.my.id/images/1760874045320-gvj3y.webp)
    - Gunakan perintah berikut untuk menghubungkan ke instance NVC Anda:
    ```bash
    ssh -i /path/to/your/private_key.pem username@floating_ip_address
    ```
    Gantilah `/path/to/your/private_key.pem` dengan path ke file kunci privat Anda, `username` dengan nama pengguna yang sesuai (misalnya `ubuntu` untuk Ubuntu, `centos` untuk CentOS), dan `floating_ip_address` dengan alamat IP publik instance NVC Anda.

Dengan mengikuti langkah-langkah di atas, Anda dapat dengan mudah melakukan order Neo Virtual Compute (NVC) dan mengaksesnya untuk menjalankan aplikasi dan layanan Anda di Biznet Gio Cloud.