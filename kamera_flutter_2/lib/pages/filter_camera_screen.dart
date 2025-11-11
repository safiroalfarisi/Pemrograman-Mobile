import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import '../widget/filter_carousel.dart';
import 'preview_page.dart';

class FilterCameraScreen extends StatefulWidget {
  final CameraDescription camera;
  const FilterCameraScreen({super.key, required this.camera});

  @override
  State<FilterCameraScreen> createState() => _FilterCameraScreenState();
}

class _FilterCameraScreenState extends State<FilterCameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  Color _activeFilter = Colors.transparent;

  final List<Color> _filters = [
    Colors.transparent,
    Colors.red.withOpacity(0.4),
    Colors.green.withOpacity(0.4),
    Colors.blue.withOpacity(0.4),
    Colors.orange.withOpacity(0.4),
    Colors.purple.withOpacity(0.4),
    Colors.yellow.withOpacity(0.4),
  ];

  @override
  void initState() {
    super.initState();
    _controller = CameraController(widget.camera, ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onFilterChanged(Color newColor) {
    setState(() {
      _activeFilter = newColor;
    });
  }

  Future<void> _takePictureWithFilter() async {
    try {
      await _initializeControllerFuture;
      final image = await _controller.takePicture();

      if (!mounted) return;

      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>
              PreviewPage(imagePath: image.path, filterColor: _activeFilter),
        ),
      );
    } catch (e) {
      debugPrint('Error saat mengambil gambar: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                Positioned.fill(
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      _activeFilter,
                      BlendMode.softLight,
                    ),
                    child: CameraPreview(_controller),
                  ),
                ),
                // Carousel filter di bawah
                Align(
                  alignment: Alignment.bottomCenter,
                  child: PhotoFilterCarousel(
                    filters: _filters,
                    activeFilter: _activeFilter,
                    onFilterChanged: _onFilterChanged,
                    onFilterTapCapture: _takePictureWithFilter,
                  ),
                ),
                // Tombol back
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
