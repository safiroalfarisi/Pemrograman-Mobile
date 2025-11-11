import 'dart:io';
import 'package:flutter/material.dart';

class PreviewPage extends StatelessWidget {
  final String imagePath;
  final Color filterColor; // ✅ tambahkan ini

  const PreviewPage({
    super.key,
    required this.imagePath,
    required this.filterColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Gambar tampil penuh layar
          Positioned.fill(
            child: Image.file(File(imagePath), fit: BoxFit.cover),
          ),

          // ✅ Overlay warna filter (transparan)
          Positioned.fill(
            child: Container(
              color: filterColor.withOpacity(0.3), // ubah opacity sesuai selera
            ),
          ),

          // Tombol kembali di pojok kiri atas
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
