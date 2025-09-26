void main(){
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  print(halogens);

  var names1 = <String>{};
  Set<String> names2 = {}; // This works, too.
  var names3 = {}; // Creates a map, not a set.

  print(names1);
  print(names2);
  print(names3);

  
  names1.add('Safiro Alfarisi Haraya'); 
  names1.add('2341720178A');

  names2.addAll([
    'Safiro Alfarisi Haraya',
    '2341720178',
  ]);

  names3['nama'] = 'Safiro Alfarisi Haraya';
  names3['nim'] = '2341720178';

  print(names1);
  print(names2);
  print(names3);
}