import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'pages/filter_camera_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Dapatkan daftar kamera
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;
  const MyApp({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera + Filter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: FilterCameraScreen(camera: camera),
    );
  }
}
