# Codelab 11 – Pemrograman Asynchronous

## 👤 Identitas
**Nama : Safiro Alfarisi Haraya**
**NIM : 2341720178**
**Kelas/No : TI-3F/27

---

## Praktikum 1 – Mengunduh Data dari Web Service (API)

### Soal 1  
**Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda.**

**Jawaban:**  
``` Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future Demo - Ammar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FuturePage(),
    );
  }
```
---

### Soal 2.1  
**Carilah judul buku favorit Anda di Google Books, lalu ganti ID buku pada variabel path di kode tersebut. Caranya ambil di URL browser Anda seperti gambar berikut ini.**

**Jawaban:**  
```  Future<Response> getData() async {
    const authority = 'www.googleapis.com';
    const path = '/books/v1/volumes/5HrrDwAAQBAJ';
    final Uri url = Uri.https(authority, path);
    return http.get(url);
  }
```



### Soal 2.2  
**Kemudian cobalah akses di browser URI tersebut dengan lengkap seperti ini. Jika menampilkan data JSON, maka Anda telah berhasil.**



---

### Soal 3  
**Jelaskan maksud kode langkah 5 tersebut terkait substring dan catchError!**

**Jawaban:**  

- **`substring`**  
  .substring(0, 450) → memotong teks tersebut mulai dari indeks ke-0 sampai ke-449, jadi hanya menampilkan 450 karakter pertama. Agar data yang ditampilkan ke layar tidak terlalu panjang (karena response JSON bisa sangat besar).
 Misalnya, kalau body berisi 10.000 karakter, hanya 450 karakter pertama yang diambil untuk pratinjau cepat.

- **`catchError`**  
  Menampilkan pesan 'An error occurred' agar pengguna tahu bahwa ada kegagalan saat memuat data.
 Pemanggilan setState() memastikan teks hasil (result) yang ditampilkan di UI ikut diperbarui.

---

### Bukti Praktikum 1  
![Praktikum 1](img/prak1.gif)

---

## Praktikum 2 – Menggunakan await/async untuk menghindari callbacks

### Soal 1  
**Jelaskan maksud kode langkah 1 dan 2 tersebut!**

**Jawaban:**  

- **`Langkah Pertama`**  
   Pada langkah pertama kita membuat tiga method asyncronus dan tiap method memiliki delay 3 detik tetapi memiliki nilai return yang berbeda beda 1,2 dan 3

- **`Langkah Kedua`**  
   dan pada method count yang akan dipanggil saat user menekan tombol go dan pada method count dimulai dari var total yaitu 0 dan menunggu tiap method async return 1 2 3 terpanggil dengan waktu delay 9 detik dan nilai returnnya 6 yang akan ditampilkan pada ui 

---

### Bukti Praktikum 2  
![Praktikum 2](img/prak2.gif)

---

## Praktikum 3 – Menggunakan Completer di Future

### Soal 1  
**Jelaskan maksud kode langkah 2 tersebut!**

**Jawaban:**  

- **`getNumber`**  
   getNumber() langsung mengembalikan Future yang belum selesai.
   Tapi 5 detik kemudian, Future itu akan selesai dan memberikan nilai 42.

- **`calculate`**  
   Future yang dikembalikan oleh getNumber() sekarang dianggap selesai (completed), dengan hasil nilai 42.

---

### Bukti Praktikum 3 Langkah 4
![Praktikum 3.4](lib/assets/gif/prak3.gif)

### Soal 2  
**Jelaskan maksud perbedaan kode langkah 2 dengan langkah 5-6 tersebut!**

**Jawaban:**  
   logika method masih sama saja tetapi pada method yang sudah diperbarui memiliki try catch error yang dapat menampilkan pesan saat ada error 

### Bukti Praktikum 3
![Praktikum 3](img/prak3.gif)

---

## Praktikum 4 – Memanggil Future secara paralel

### Soal 1  
**Jelaskan maksud perbedaan kode langkah 1 dan 4!**

**Jawaban:**  

- **`FutureGroup`**  
   Future group dipakai ketika kita ingin menambah future secara dinamis sebelum close dipanggil 

- **`Future.wait`**  
   Semua future dijalankan secara pararel atau semua method langsung berjalan bersamaan 

---

### Bukti Praktikum 4
![Praktikum 4](img/prak4.gif)

---

##  Praktikum 5 – Menangani Respon Error pada Async Code

### Soal 1  
**Panggil method handleError() tersebut di ElevatedButton, lalu run. Apa hasilnya? Jelaskan perbedaan kode langkah 1 dan 4!**

**Jawaban:**  

- **`handleError`**  
   Menangani error menggunakan try catch agar error tidak menyebabkan crash di program mengganti error dengan teks lain

- **`returnError`**  
   Kebalikan dari handleError jika dipakai pada aplikasi dan ada error maka aplikasi akan crash 

---

### Bukti Praktikum 5
![Praktikum 5](img/prak5.gif)

---

## Praktikum 6 – Menggunakan Future dengan StatefulWidget

### Soal 1  
**Tambahkan nama panggilan Anda pada tiap properti title sebagai identitas pekerjaan Anda.**

**Jawaban:**  
```    Widget build(BuildContext context) {
    final myWidget = myPosition == ''
        ? const CircularProgressIndicator()
        : Text(myPosition);

    return Scaffold(
      appBar: AppBar(title: const Text('Current Location - Ammar')),
      body: Center(child: myWidget),
    );
  }

```
### Soal 2
**Apakah Anda mendapatkan koordinat GPS ketika run di browser? Mengapa demikian?**

**Jawaban:**  
   Tetap mendapatkan kordinat GPS seperti di emulator karena web mengirimkan izin membagikan lokasi terkini terlebih dahulu dan lokasi baru ditampilkan dan terlebih ini flutter 1 code bisa dijalankan di berbagai platform

---

### Bukti Praktikum 6
![Praktikum 6](img/prak6.gif)

---

## Praktikum 7 – Manajemen Future dengan FutureBuilder

### Soal 1  
**Apakah ada perbedaan UI dengan praktikum sebelumnya? Mengapa demikian?**

**Jawaban:**  
  tidak ada perbedaan UI namun hasil UI saja yang berbeda seperti yang sebelumnya loading lebih cepat sekarang 3 detik (lebih lama) dan sekarang position null tidak ada titik kordinat


### Soal 2  
**Apakah ada perbedaan UI dengan langkah sebelumnya? Mengapa demikian?**

**Jawaban:**  
  Perbedaan UI hanya pada handle error saja sekarang menampilkan pesan ke aplikasi bukan null saja

###  Bukti Praktikum 7
![Praktikum 7.1](img/prak7.jpg)

---

## Praktikum 8 – Navigation route dengan Future Function

### Soal 1  
**Tambahkan nama panggilan Anda pada tiap properti title sebagai identitas pekerjaan Anda.**

**Jawaban:**  
```     
Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(title: const Text('Navigation First Screen - Ammar')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Change Color'),
          onPressed: () {
            _navigateAndGetColor(context);
          },
        ),
      ),
    );
  }

```

### Soal 2  
**Silakan ganti dengan warna tema favorit Anda.**

**Jawaban:**  
```    
class _NavigationFirstState extends     State<NavigationFirst> {
  Color color = const Color.fromARGB(255, 159, 57, 255);

```

### Soal 3  
**Cobalah klik setiap button, apa yang terjadi ? Mengapa demikian ?**

**Jawaban:**  
   warna screen (background) akan berubah sesuai warna yang dipilih dan yang telah disediakan

### Soal 4  
**Gantilah 3 warna pada langkah 5 dengan warna favorit Anda!**

**jawaban:**  
```    
ElevatedButton(
              child: const Text('Green'),
              onPressed: () {
                color = const Color.fromARGB(255, 140, 217, 25);
                Navigator.pop(context, color);
              },
            ),
            ElevatedButton(
              child: const Text('Blue'),
              onPressed: () {
                color = const Color.fromARGB(255, 67, 8, 229);
                Navigator.pop(context, color);
              },
            ),
            ElevatedButton(
              child: const Text('Red'),
              onPressed: () {
                color = const Color.fromARGB(255, 180, 15, 15);
                Navigator.pop(context, color);
              },
            ),

```

### Bukti Praktikum 8
![Praktikum 8](img/prak8.gif)

---

## Praktikum 9 – Memanfaatkan async/await dengan Widget Dialog

### Soal 1  
**Cobalah klik setiap button, apa yang terjadi ? Mengapa demikian ?**

**Jawaban:**  
  Masih ada error ui atau background tidak berganti warna dikarenakan variabel state tidak diperbarui meskipun memanggil setState({}) di akhir fungsi _showColorDialog, tidak memberi tahu setState nilai baru apa yang harus digunakan. variabel state color (this.color) tetap menggunakan nilai lamanya.

### Soal 2  
**Gantilah 3 warna pada langkah 3 dengan warna favorit Anda!**

**Jawaban:**  
``` 
  TextButton(
              child: const Text('Pink'),
              onPressed: () {
                final selectedColor = const Color.fromARGB(255, 215, 48, 227);
                Navigator.pop(context, selectedColor);
              },
            ),
            TextButton(
              child: const Text('Green'),
              onPressed: () {
                final selectedColor = const Color.fromARGB(255, 0, 128, 0);
                Navigator.pop(context, selectedColor);
              },
            ),
            TextButton(
              child: const Text('Black'),
              onPressed: () {
                final selectedColor = const Color.fromARGB(255, 0, 0, 0);
                Navigator.pop(context, selectedColor);
              },
            ),
```


### Bukti Praktikum 9
![Praktikum 9](img/prak9.gif)

---