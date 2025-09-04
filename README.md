Nama  : Safiro Alfarisi Haraya
NIM   : 2341720178
Kelas : TI-3F
Absen : 27

Soal 1
Modifikasilah kode pada baris 3 di VS Code atau Editor Code favorit Anda berikut ini agar mendapatkan keluaran (output) sesuai yang diminta!
Penyesuaian Kode
[Modifikasi Kode awal](C:\Pemrograman-Mobile\Codelab02\src\soal1.dart)
Kode yang sudah saya sesuaikan akan memberikan hasil seperti gambar dibawah ini
![Hasil modifikasi kode awal](C:\Pemrograman-Mobile\Codelab02\result\soal1.jpg)

Soal 2
Mengapa sangat penting untuk memahami bahasa pemrograman Dart sebelum kita menggunakan framework Flutter ? Jelaskan!

Flutter dibangun menggunakan bahasa Dart. Artinya, semua widget, logika aplikasi, dan interaksi dalam Flutter ditulis dengan Dart. Jika kita tidak memahami Dart, maka kita akan kesulitan dalam membangun aplikasi menggunakan framework flutter.

Soal 3
Rangkumlah materi dari codelab ini menjadi poin-poin penting yang dapat Anda gunakan untuk membantu proses pengembangan aplikasi mobile menggunakan framework Flutter.

--Arithmetic Operators
    + untuk tambahan.
    - untuk pengurangan.
    * untuk perkalian.
    / untuk pembagian.
    ~/ untuk pembagian bilangan bulat. Di Dart, setiap pembagian sederhana dengan / menghasilkan nilai double. Untuk mendapatkan nilai bilangan bulat, Anda perlu membuat semacam transformasi (yaitu, typecast) dalam bahasa pemrograman lain; namun Dart sudah mendukung untuk operasi ini.
    % untuk operasi modulus (sisa bagi dari bilangan bulat).
    -expression untuk negasi (yang membalikkan suatu nilai).
    Dart juga menyediakan shortcut operator untuk menggabungkan variabel setelah operasi lainnya. Operator aritmatika atau shortcut operator adalah +=, -=, *=, /=, dan ~/=.
--Operator Increment & Decrement

    ++var atau var++ untuk menambah nilai variabel var sebesar 1
    --var atau var-- untuk mengurangi nilai variabel var sebesar 1
--Operator Equality dan Relational
Persamaan operator Dart dijelaskan sebagai berikut:
    == untuk memeriksa apakah operan sama
    != untuk memeriksa apakah operan berbeda
    Untuk melakukan pengujian relasional, maka gunakan operator sebagai berikut:
    > memeriksa apakah operan kiri lebih besar dari operan kanan
    < memeriksa apakah operan kiri lebih kecil dari operan kanan
    >= memeriksa apakah operan kiri lebih besar dari atau sama dengan operan kanan
    <= memeriksa apakah operan kiri kurang dari atau sama dengan operan kanan
    Di Dart, tidak seperti Java dan bahasa lainnya, operator == tidak membandingkan referensi/alamat memori melainkan isi dari variabel tersebut.
    Juga, tidak seperti JavaScript, tidak ada operator === yang diperlukan pada Dart karena telah memiliki fitur type safety yang memastikan bahwa operator persamaan == hanya digunakan pada objek dengan tipe yang sama.
--Operator Logical
    !expression negasi atau kebalikan hasil ekspresi—yaitu, true menjadi false dan false menjadi true.
    || menerapkan operasi logika OR antara dua ekspresi.
    && menerapkan operasi logika AND antara dua ekspresi.

Soal 4
Buatlah penjelasan dan contoh eksekusi kode tentang perbedaan Null Safety dan Late variabel !

--Null Safety
    logika yang dibuat untuk pengecekan pada variable yang memastikan agar variable tersebut tidak memiliki nilai null, logika ini biasa dipakai untuk variable yang tidak diperbolehkan null.
--Late Variable
    late variabel digunakan untuk kita membuat suatu variable tetapi dapat wajib diisi nantinya agar tidak ada error seperti sapaan aplikasi setelah kita login.
Contoh Kode
[Contoh kode penerapan Null Safety & Late Variable](C:\Pemrograman-Mobile\Codelab02\src\soal4.dart)
Hasil
![Hasil kode penerapan Null Safety & Late Variable](C:\Pemrograman-Mobile\Codelab02\result\soal4.jpg)