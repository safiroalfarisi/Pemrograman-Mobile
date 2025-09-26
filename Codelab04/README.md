# Codelab 04 - Collection, Record, And Function

- **Nama**  : Safiro Alfarisi Haraya 
- **NIM**   : 2341720178  
- **Kelas** : TI - 3F  

---

# Praktikum 1 – Data List

### Screenshot Praktikum 1
![Praktikum 1](img\Praktikum1.jpg)

### Penjelasan Praktikum 1
List pada dart sama dengan array pada pemrograman lain bisa kita lihat pada gambar di atas kita membuat 5 list atau 5 tempat dan berisikan null tetapi list 1 dan 2 saya masukan nama dan nim saya sendiri

# Praktikum 2 – Data Set 

### Screenshot Praktikum 2
![Praktikum 2](img\Praktikum2.jpg)

### Penjelasan Praktikum 2
Data Set pada dart merupakan data yang tidak bisa diduplikatkan dan tidak terurut

# Praktikum 3 – Data Maps 

### Screenshot Praktikum 3
![Praktikum 3](img\Praktikum3.jpg)

### Penjelasan Praktikum 3
Data Maps sama seperti list tetapi yang membedakannya adalah data maps memiliki key dan value pada data yang disimpannya.

# Praktikum 4 – Spread dan Control-flow Operators

### Screenshot Praktikum 4
![Praktikum 4](img\Praktikum4.jpg)

### Penjelasan Praktikum 4
Pada praktikum 4 kita mencoba eksperimen data set dari menggunakan data list lain untuk menjadi data dari list tersebut sampai mengubah semua data list menjadi aturan yang kita mau.

### Screenshot Praktikum 5
![Praktikum 5](img\Praktikum5.jpg)

### Penjelasan Praktikum 5
Pada praktikum 5 kita mencoba data record eksperimen untuk menukar data yang sudah ada ke data yang sudah ada lainnya.
---

## Tugas Praktikum

## 2. Functions dalam Dart
function adalah sebuah blok kode terorganisir yang dapat digunakan kembali untuk melakukan sebuah tugas atau aksi spesifik. Fungsi merupakan fondasi dari pemrograman modular, karena memungkinkan kita untuk memecah program yang kompleks menjadi bagian-bagian yang lebih kecil dan lebih mudah dikelola.

## 3. Jelaskan jenis-jenis parameter di Functions beserta contoh sintaksnya!

### Positional Parameter
Jenis parameter standar dan wajib diisi. Nilai harus diberikan sesuai urutan saat fungsi dideklarasikan.  

### Optional Positional Parameter
Parameter opsional namun posisinya tetap berurutan. Diletakkan setelah parameter wajib dan ditandai dengan [ ].  

### Named Parameter
Parameter opsional yang dipanggil berdasarkan namanya, bukan posisinya. Sangat jelas jika parameter banyak. Ditandai dengan { } dan bisa diwajibkan dengan required.  

## 4. First-Class Object
Dalam Dart, fungsi diperlakukan sebagai first-class objects. Ini adalah konsep fundamental yang berarti fungsi dapat diperlakukan seperti nilai atau objek lainnya. Secara spesifik, sebuah fungsi dapat:
- Disimpan dalam sebuah variabel.
- Dilewatkan sebagai argumen ke fungsi lain.
- Dikembalikan sebagai hasil (return value) dari fungsi lain.

### contoh
```dart
void sapa(String nama) {
  print('Halo, $nama');
}

// Fungsi ini menerima fungsi lain sebagai argumen
void prosesNama(String nama, Function(String) callback) {
  callback(nama);
}

void main() {
  // 1. Menyimpan fungsi dalam variabel `greeting`
  var greeting = sapa;
  greeting('Firo'); // Memanggil fungsi melalui variabel

  // 2. Melewatkan fungsi `sapa` sebagai argumen
  prosesNama('Shiro', sapa);
}
```
## 5. Anonymous Functions (Fungsi Anonim)
Anonymous function, sering juga disebut lambda atau closure, adalah fungsi yang tidak memiliki nama. Fungsi ini sangat berguna untuk operasi singkat yang tidak perlu dideklarasikan secara formal, sering kali digunakan sebagai argumen untuk fungsi tingkat tinggi (higher-order functions) seperti forEach, map, atau where.

### contoh
```dart
void main() {
  var namaBuah = ['Apel', 'Jeruk', 'Mangga'];

  // Menggunakan fungsi anonim dalam method forEach
  namaBuah.forEach((buah) {
    print('Saya suka buah $buah');
  });

  // Sintaks fat arrow `=>` untuk fungsi anonim satu baris
  var panjangNama = namaBuah.map((buah) => buah.length);
  print('Panjang karakter nama buah: $panjangNama'); // Output: (4, 5, 6)
}
```

# 6. Perbedaan Lexical Scope dan Lexical Closures

## 1. Lexical Scope
Lexical scope adalah aturan di mana jangkauan (scope) sebuah variabel ditentukan secara statis oleh lokasi variabel tersebut di dalam kode sumber. Artinya, sebuah blok kode (seperti di dalam fungsi) dapat mengakses variabel yang didefinisikan di blok kode yang melingkupinya.

### Contoh:
```dart
void main() {
  var name = "Firo";

  void sayHello() {
    print("Hello, $name"); // bisa akses 'name' karena scope luar
  }

  sayHello(); // Output: Hello, firo
}
```
## 2. Lexical Closures
Sebuah closure adalah objek fungsi spesial yang "mengingat" lingkungan leksikal (variabel dan fungsi) tempat ia dibuat. Dengan kata lain, sebuah fungsi dapat mengakses variabel dari scope induknya bahkan setelah scope induk tersebut selesai dieksekusi.

### Contoh:
```dart
// Fungsi ini mengembalikan sebuah closure
Function buatPenghitung() {
  int nilai = 0;
  
  // Fungsi anonim di bawah ini adalah sebuah closure.
  // Ia "menutup" (closes over) variabel `nilai`.
  return () {
    nilai++;
    print('Nilai sekarang: $nilai');
  };
}

void main() {
  // `penghitung` adalah closure yang mengingat variabel `nilai` miliknya sendiri
  var penghitung = buatPenghitung();

  penghitung(); // Output: Nilai sekarang: 1
  penghitung(); // Output: Nilai sekarang: 2
  penghitung(); // Output: Nilai sekarang: 3
}
```

# 7. Return Multiple Value di Functions

Sejak Dart 3.0, cara terbaik dan paling aman untuk mengembalikan beberapa nilai dari sebuah fungsi adalah dengan menggunakan Records. Records adalah tipe data koleksi anonim yang memungkinkan penggabungan beberapa objek ke dalam satu objek tunggal.

---

## 1. Menggunakan `List`
```dart
List<int> getCoordinates() {
  return [10, 20];
}

void main() {
  var coords = getCoordinates();
  print("X: ${coords[0]}, Y: ${coords[1]}"); // Output: X: 10, Y: 20
}
```

## 2. Menggunakan `Map`
```dart
Map<String, dynamic> getStudent() {
  return {
    "name": "Firo",
    "nim": "2341720178"
  };
}

void main() {
  var student = getStudent();
  print("Name: ${student['name']}, NIM: ${student['nim']}");
}
```

## 3. Menggunakan `Class atau Record`
```dart
class Result {
  final int min;
  final int max;

  Result(this.min, this.max);
}

Result findMinMax(List<int> numbers) {
  numbers.sort();
  return Result(numbers.first, numbers.last);
}

void main() {
  var result = findMinMax([5, 2, 9, 1]);
  print("Min: ${result.min}, Max: ${result.max}"); // Output: Min: 1, Max: 9
}
```

## 4. Menggunakan `Record`
```dart
(int, int) getRange() {
  return (1, 100);
}

void main() {
  var (start, end) = getRange();
  print("Start: $start, End: $end"); // Output: Start: 1, End: 100
}
```