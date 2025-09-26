void main(){
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 2,
  };

  print(gifts);
  print(nobleGases);

  var mhs1 = Map<String, String>();
  gifts['nama'] = 'Safiro Alfarisi Haraya';
  gifts['nim'] = '2341720178';
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  var mhs2 = Map<int, String>();
  nobleGases[0] = 'Safiro Alfarisi Haraya';
  nobleGases[1] = '2341720178';
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';

  mhs1['nama'] = 'Safiro Alfarisi Haraya';
  mhs1['nim'] = '2341720178';

  mhs2[1] = 'Safiro Alfarisi Haraya';
  mhs2[2] = '2341720178';

  print(gifts);
  print(nobleGases);
  print(mhs1);
  print(mhs2);
}