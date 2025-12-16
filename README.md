# Codelab 12 – State Management dengan Streams

## Identitas
**Nama: Safiro Alfarisi Haraya**
**Kelas/no : TI-3F/27**
**NIM : 2341720178**

---

## Praktikum 1 – Dart Streams

### Soal 1  
**Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda.**

**Jawaban:**  
``` 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firo',
```
---

### Soal 1.2
**Gantilah warna tema aplikasi sesuai kesukaan Anda.**

**Jawaban:**  
```  
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firo',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: const StreamHomePage(),
    );
  }
}
```
---

### Soal 2  
**Tambahkan 5 warna lainnya sesuai keinginan Anda pada variabel colors tersebut.**

**Jawaban:**  
```  
import 'package:flutter/material.dart';

class ColorStream{
  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.cyan,
    Colors.teal,
  ];
}
```
---

### Soal 3  
**Jelaskan fungsi keyword yield* pada kode tersebut!**

**Jawaban:**  

yield* berfungsi untuk meneruskan semua event dari Stream.periodic() ke dalam getColors(),
sehingga setiap detik fungsi ini akan “memancarkan” warna baru ke subscriber yang mendengarkan stream tersebut.

---

### Soal 3.2  
**Apa maksud isi perintah kode tersebut?**

**Jawaban:**  

Kode tersebut membuat stream yang memancarkan warna dari daftar colors, berubah setiap 1 detik, dan terus berulang tanpa henti.

---

### Soal 4  
**Capture hasil praktikum Anda berupa GIF dan lampirkan di README.**

**Jawaban:**  

### Bukti Praktikum 1  
![Praktikum 1](img/prak1.gif)

---
### Soal 5  
**Jelaskan perbedaan menggunakan listen dan await for (langkah 9) !**

**Jawaban:**  

- **`Listen`**  
   Stream akan mengirimkan warna setiap detik, dan callback ini akan dipanggil setiap kali ada event baru.
   Namun, kode setelah listen() langsung lanjut jalan tanpa menunggu semua event selesai.

- **`Await`**  
   program menunggu setiap event stream secara berurutan, baru lanjut ke iterasi berikutnya.
   Biasanya dipakai di fungsi async ketika kamu ingin mengontrol urutan eksekusi atau menunggu sampai stream selesai sepenuhnya.


---

## Praktikum 2 – Stream controllers dan sinks
### Soal 6
**Jelaskan maksud kode langkah 8 dan 10 tersebut!**

**Jawaban:**  

- **`initState()`**  
   Kode initState() ini membuat stream listener yang selalu memantau data baru dari NumberStream.
   Setiap kali ada angka baru dikirim ke stream, nilai lastNumber akan berubah dan UI diperbarui secara otomatis.

- **`addRandomNumber()`**  
   Fungsi addRandomNumber() adalah pengirim data (input).
   Fungsi ini men-generate angka acak dan mengirimkannya ke stream,
   sementara initState() tadi adalah penerima data (listener) yang menampilkan hasilnya di UI.

---
### Soal 6.2  
**Capture hasil praktikum Anda berupa GIF dan lampirkan di README.**

**Jawaban:**  

### Bukti Praktikum 2  
![Praktikum 2](img/prak2.gif)

---

### Soal 7
**Jelaskan maksud kode langkah 13 sampai 15 tersebut!**

**Jawaban:**  

- **`Langkah 13`**  
   addError() digunakan untuk mensimulasikan kondisi error dalam aliran data stream.

- **`Langkah 14`**  
   stream.listen(...) digunakan untuk mendengarkan data baru yang dikirim ke stream.
   bagian (event) berisi data hasil add() dari StreamController.

- **`Langkah 15`**  
   Dua baris pertama dikomentari karena tidak lagi mengirim data acak.
   Diganti dengan pemanggilan numberStream.addError() yang dibuat pada langkah 13.

---

### Soal 7.2  
**Kembalikan kode seperti semula pada Langkah 15, comment addError() agar Anda dapat melanjutkan ke praktikum 3 berikutnya.**

**Jawaban:**  
```  
  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10);
    numberStream.addNumberToSink(myNum);
    // numberStream.addError();
  }
```

## Praktikum 3 – Injeksi data ke streams

### Soal 8  
**Jelaskan maksud kode langkah 1-3 tersebut!**

**Jawaban:**  

- **`Langkah 1`**  
   Variabel ini digunakan untuk menyimpan logika transformasi data stream. StreamTransformer adalah objek di Dart yang berfungsi untuk memodifikasi data yang lewat di dalam stream, sebelum data diterima oleh listen(), data tersebut akan diubah terlebih dahulu oleh transformer sesuai logika yang kita buat nanti.

- **`Langkah 2`**  
   StreamTransformer ini berfungsi sebagai filter atau pipa pengubah data/error sebelum data dikonsumsi oleh UI.

- **`Langkah 3`**  
   Nilai hasil transformasi diterima di listen() dan disimpan ke variabel lastNumber untuk ditampilkan di UI.

---

### Soal 8.2  
**Capture hasil praktikum Anda berupa GIF dan lampirkan di README.**

**Jawaban:**  

### Bukti Praktikum 3  
![Praktikum 3](img/prak3.gif)

---

## Praktikum 4 – Subscribe ke stream events

### Soal 9  
**Jelaskan maksud kode langkah 2, 6 dan 8 tersebut!**

**Jawaban:**  

- **`Langkah 2`**  
   Kode ini menghubungkan aliran data (stream) dengan tampilan (UI) agar setiap angka baru yang dikirim ke stream langsung muncul di layar.

- **`Langkah 6`**  
   subscription.cancel() = berhenti mendengarkan data dari stream agar aman dan efisien.

- **`Langkah 8`**  
   Fungsi ini mencoba mengirim angka acak ke stream.
   Kalau stream masih hidup maka kirim angka ke UI.
   Kalau stream sudah mati maka tampilkan -1 di layar sebagai tanda error.

---

### Soal 9.2  
**Capture hasil praktikum Anda berupa GIF dan lampirkan di README.**

**Jawaban:**  

### Bukti Praktikum 4 
![Praktikum 4](img/prak4.gif)

---

## Praktikum 5 – Multiple stream subscriptions

### Soal 10  
**Jelaskan mengapa error itu bisa terjadi ?**

**Jawaban:**  
error itu muncul karena stream single-subscription sedang di-listen lebih dari sekali. Pastikan hanya satu listen aktif untuk stream tersebut, atau jadikan stream broadcast jika ingin multi-listener. Kalau kamu mau, aku bisa ubah NumberStream jadi broadcast atau migasi ke StreamBuilder untuk UI supaya tidak ada listen ganda secara tidak sengaja.

---

### Soal 11 
**Jelaskan mengapa hal itu bisa terjadi ?**

**Jawaban:**  
duplikasi terjadi karena ada dua listen pada stream yang sama, dan keduanya menambah values.

---

### Soal 11.2  
**Capture hasil praktikum Anda berupa GIF dan lampirkan di README.**

**Jawaban:**  

### Bukti Praktikum 5 
![Praktikum 5](img/prak5.gif)

---

## Praktikum 6 – StreamBuilder

### Soal 12  
**Jelaskan maksud kode pada langkah 3 dan 7 !**

**Jawaban:**  

- **`Langkah 3`**  
   Menghasilkan aliran (Stream<int>) angka acak 0–9 setiap 1 detik, tanpa henti, Stream.periodic(Duration(seconds: 1), …) memanggil callback tiap detik. Parameter t adalah hitungan tick (0,1,2,…) namun tidak dipakai. Callback mengembalikan random.nextInt(10) yang menghasilkan angka 0–9.

- **`Langkah 7`**  
   Mendengarkan numberStream dan me-render ulang UI setiap kali stream mengirim nilai baru.

---

### Soal 12.2
**Capture hasil praktikum Anda berupa GIF dan lampirkan di README.**

**Jawaban:**  

### Bukti Praktikum 6
![Praktikum 6](img/prak6.gif)

---

## Praktikum 7 – BLoC Pattern

### Soal 13  
**Jelaskan maksud praktikum ini ! Dimanakah letak konsep pola BLoC-nya ?**

**Jawaban:**  
  UI (FAB ditekan) → event ke generateRandom → BLoC proses → state baru ke randomNumber → UI rebuild via StreamBuilder.
  Struktur ini sudah memisahkan UI dari logic bisnis (inti BLoC), dengan arus data satu arah: event masuk, state keluar

### Soal 13.2
**Capture hasil praktikum Anda berupa GIF dan lampirkan di README.**

**🧠 Jawaban:**  

### ✅ Bukti Praktikum 7
![Praktikum 7](img/prak7.gif)


---