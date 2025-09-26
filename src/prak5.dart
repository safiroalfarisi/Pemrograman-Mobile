(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}

void main() {
  var record = ('first', a: 2, b: true, 'last');
  print(record);

  print(tukar((1, 2)));

  // Record type annotation in a variable declaration:
  (String, int) mahasiswa = ('Safiro Alfarisi Haraya', 23417202178);
  print(mahasiswa);

  var mahasiswa2 = ('Safiro Alfarisi Haraya', a: 2341720178, b: true, 'last');

  print(mahasiswa2.$1); // Prints 'first'
  print(mahasiswa2.a); // Prints 2
  print(mahasiswa2.b); // Prints true
  print(mahasiswa2.$2); // Prints 'last'
}