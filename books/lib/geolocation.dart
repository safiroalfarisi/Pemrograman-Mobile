import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Future<Position>? position;

  @override
  void initState() {
    super.initState();
    position = getPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Current Location Firo')),
      body: Center(
        child: FutureBuilder<Position>(
          future: position,
          builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              final pos = snapshot.data!;
              // beri waktu 5 detik agar perekam sempat menyimpan frame terakhir
              Future.delayed(const Duration(seconds: 5));
              return Text(
                'Latitude: ${pos.latitude}\nLongitude: ${pos.longitude}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              );
              return Text(
                'Latitude: ${pos.latitude}\nLongitude: ${pos.longitude}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              );
            } else {
              return const Text('Tidak dapat memuat lokasi.');
            }
          },
        ),
      ),
    );
  }

  Future<Position> getPosition() async {
    // Pastikan layanan lokasi aktif
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Layanan lokasi tidak aktif.');
    }

    // Minta izin lokasi
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Izin lokasi ditolak.');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Izin lokasi ditolak permanen.');
    }

    // Simulasi loading biar kelihatan saat direkam
    await Future.delayed(const Duration(seconds: 3));

    // Ambil posisi
    Position pos = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Tambahkan delay kecil biar rekaman sempat menangkap hasil
    await Future.delayed(const Duration(seconds: 3));

    return pos;
  }
}
