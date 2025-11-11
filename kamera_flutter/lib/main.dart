import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'widget/takepicture_screen.dart';

Future<void> main() async {
  // Pastikan binding sudah diinisialisasi sebelum memanggil plugin kamera
  WidgetsFlutterBinding.ensureInitialized();

  // Dapatkan daftar kamera yang tersedia
  final cameras = await availableCameras();

  // Pilih kamera pertama (biasanya kamera belakang)
  final firstCamera = cameras.first;

  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;
  const MyApp({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Camera Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: TakePictureScreen(camera: camera),
    );
  }
}
