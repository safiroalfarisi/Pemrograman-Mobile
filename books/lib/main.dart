
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future Demo Firo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = '';
  late Completer completer;
  bool isLoading = false; // ✅ indikator loading

  // ------------------------
  // PRAKTIKUM 2
  // ------------------------
  Future<int> returnOneAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }

  Future count() async {
    int total = 0;
    total = await returnOneAsync();
    total += await returnTwoAsync();
    total += await returnThreeAsync();
    setState(() {
      result = total.toString();
    });
  }

  // ------------------------
  // PRAKTIKUM 3
  // ------------------------
  Future getNumber() {
    completer = Completer<int>();
    calculate2();
    return completer.future;
  }

  Future calculate2() async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      completer.complete(42);
    } catch (_) {
      completer.completeError({});
    }
  }

  // ------------------------
  // PRAKTIKUM 4
  // ------------------------
  Future<void> returnFG() async {
    final futures = Future.wait<int>([
      returnOneAsync(),
      returnTwoAsync(),
      returnThreeAsync()
    ]);

    final List<int> value = await futures;

    int total = 0;
    for (var element in value) {
      total += element;
    }

    setState(() {
      result = total.toString();
    });
  }

  // ------------------------
  // PRAKTIKUM 5
  // ------------------------
  Future returnError() async {
    await Future.delayed(const Duration(seconds: 2));
    throw Exception('Something terrible happened');
  }

  Future handleError() async {
    try {
      await returnError();
      setState(() {
        result = 'Success';
      });
    } catch (error) {
      setState(() {
        result = error.toString();
      });
    } finally {
      print('Complete');
    }
  }

  // ------------------------
  // UI
  // ------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back from the Future Firo'),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            ElevatedButton(
              child: const Text('Go'),
              onPressed: () async {
                // ✅ Aktifkan loading
                setState(() {
                  isLoading = true;
                  result = '';
                });

                // ✅ Beri kesempatan UI untuk menggambar ulang
                await Future.delayed(Duration.zero);

                // --- PILIH PRAKTIKUM ---
                // await count();        // PRAKTIKUM 2
                // await getNumber();    // PRAKTIKUM 3
                // await returnFG();     // PRAKTIKUM 4
                await handleError();     // PRAKTIKUM 5

                // ✅ Matikan loading setelah async selesai
                setState(() {
                  isLoading = false;
                });
              },
            ),
            const Spacer(),
            Text(result),
            const Spacer(),
            // ✅ Loading hanya tampil saat async berjalan
            isLoading
                ? const CircularProgressIndicator()
                : const SizedBox(height: 40),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}