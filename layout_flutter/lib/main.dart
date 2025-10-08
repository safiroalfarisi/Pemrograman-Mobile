import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Title Section (Tidak ada perubahan)
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Shibuya Crossing, Tokyo',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Shibuya, Tokyo, Japan',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('4.8'),
        ],
      ),
    );

    // 2. Button Section (Tidak ada perubahan)
    Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    // 3. Text Section (Nama dan NIM diperbarui)
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Shibuya Crossing adalah salah satu persimpangan paling ikonik di dunia, '
        'terletak di depan Stasiun Shibuya, Tokyo. Tempat ini terkenal dengan '
        '"scramble" atau pemandangan ribuan pejalan kaki yang menyeberang '
        'secara bersamaan dari berbagai arah. Dikelilingi oleh layar video raksasa '
        'dan lampu neon, Shibuya Crossing telah menjadi simbol Tokyo modern. \n\n'
        'Safiro Alfarisi Haraya - 2341720178', // Nama & NIM diubah
        softWrap: true,
      ),
    );

    // Tampilan utama aplikasi
    return MaterialApp(
      title: 'Flutter layout - 2341720178',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout - 2341720178'),
        ),
        // Langkah 3: Ubah body menjadi ListView
        body: ListView(
          children: [
            // Langkah 2: Tambahkan gambar
            Image.asset(
              'lib/asset/shibuya.jpg', // Pastikan nama file dan path sesuai
              width: 600,
              height: 240,
              fit: BoxFit.cover, // Sesuai instruksi
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  // Method untuk membuat kolom tombol
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}