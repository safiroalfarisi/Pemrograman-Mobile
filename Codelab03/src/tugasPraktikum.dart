void main() {
  String nama = "Safiro Alfarisi Haraya";
  String nim = "2341720178";

  print("Bilangan Prima dari 0 sampai 201:");
  for (int i = 0; i <= 201; i++) {
    if (isPrima(i)) {
      print("$i adalah bilangan prima -> $nama | $nim");
    }
  }
}

// Fungsi untuk mengecek bilangan prima
bool isPrima(int n) {
  if (n < 2) return false;
  for (int i = 2; i * i <= n; i++) {
    if (n % i == 0) {
      return false;
    }
  }
  return true;
}
