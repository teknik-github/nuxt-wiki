# Getting Started with n8n
n8n adalah alat otomatisasi alur kerja yang kuat dan fleksibel yang memungkinkan Anda menghubungkan berbagai aplikasi dan layanan untuk mengotomatiskan tugas-tugas berulang. Panduan ini akan membantu Anda memulai dengan n8n.

## Instalasi n8n [NPM]
Anda dapat menginstal n8n menggunakan berbagai metode, termasuk Docker, npm, atau menggunakan layanan hosting seperti n8n.cloud. Berikut adalah cara menginstal n8n menggunakan npm:

```bash
npm install n8n -g
```
Setelah instalasi selesai, Anda dapat menjalankan n8n dengan perintah berikut:
```bash
n8n start
```

## Menjalankan n8n
Setelah menjalankan perintah di atas, n8n akan mulai berjalan dan Anda dapat mengakses antarmuka webnya melalui browser di alamat `http://localhost:5678`.

## Installasi n8n [Docker]
Jika Anda lebih suka menggunakan Docker, Anda dapat menjalankan n8n dengan perintah berikut:
```bash
docker volume create n8n_data

docker run -it --rm \
 --name n8n \
 -p 5678:5678 \
 -e N8N_SECURE_COOKIE=false \
 -v n8n_data:/home/node/.n8n \
 docker.n8n.io/n8nio/n8n
```

Atau dengan menggunakan Docker Compose, buat file `docker-compose.yml` dengan isi berikut:
```yamlversion: '3'
services:
  n8n:
    image: n8nio/n8n
    ports:
      - "5678:5678"
    volumes:
      - n8n_data:/home/node/.n8n
volumes:
  n8n_data:
```

Kemudian jalankan perintah berikut untuk memulai n8n:
```bash
docker-compose up -d
```

## Instalasi n8n dengan databsae eksternal
Jika Anda ingin menggunakan database eksternal seperti PostgreSQL atau MySQL, Anda perlu mengatur variabel lingkungan yang sesuai sebelum menjalankan n8n. Misalnya, untuk MySQL, Anda dapat menambahkan variabel berikut:
```bash
version: '3.8'

services:
  mysql:
    image: mysql:8.0
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: rootpassword
      MYSQL_DATABASE: n8n
      MYSQL_USER: n8n
      MYSQL_PASSWORD: n8npassword
    volumes:
      - mysql_data:/var/lib/mysql

  n8n:
    image: docker.n8n.io/n8nio/n8n
    restart: always
    ports:
      - "5678:5678"
    environment:
      - DB_TYPE=mysqldb
      - DB_MYSQLDB_DATABASE=n8n
      - DB_MYSQLDB_HOST=mysql
      - DB_MYSQLDB_PORT=3306
      - DB_MYSQLDB_USER=n8n
      - DB_MYSQLDB_PASSWORD=n8npassword
      - N8N_BASIC_AUTH_ACTIVE=true
      - N8N_HOST=localhost
      - WEBHOOK_URL=http://localhost/
      - N8N_PORT=5678
      - N8N_PROTOCOL=http
    depends_on:
      - mysql
    volumes:
      - n8n_data:/home/node/.n8n

volumes:
  mysql_data:
  n8n_data:
```

Harap dilakukan perubahan pada variabel lingkungan sesuai kebutuhan Anda seperti nama database, pengguna, kata sandi, host, webhook URL, dan lainnya.

Tambahkan baris berikut pada bagian environment untuk menonaktifkan cookie aman jika Anda tidak menggunakan HTTPS:

       - N8N_SECURE_COOKIE=false

## Penutup
Nah, sekarang Anda sudah siap untuk mulai membuat alur kerja otomatisasi dengan n8n! Jelajahi berbagai node dan integrasi yang tersedia untuk menghubungkan aplikasi dan layanan favorit Anda. Selamat mencoba!