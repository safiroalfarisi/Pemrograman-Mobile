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
  bool isLoading = false; // ✅ penanda loading

  // ------------------------
  // PRAKTIKUM 1
  // ------------------------
  // Future<Response> getData() async {
  //   const authority = 'www.googleapis.com';
  //   const path = '/books/v1/volumes/516Mae9ot04C';
  //   Uri url = Uri.https(authority, path);
  //   return http.get(url);
  // }

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
    // calculate();
    calculate2();
    return completer.future;
  }

  Future calculate() async {
    await Future.delayed(const Duration(seconds: 5));
    completer.complete(42);
  }

  calculate2() async {
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
  // void returnFG() {
  //   FutureGroup<int> futureGroup = FutureGroup<int>();
  //   futureGroup.add(returnOneAsync());
  //   futureGroup.add(returnTwoAsync());
  //   futureGroup.add(returnThreeAsync());
  //   futureGroup.close();
  //   futureGroup.future.then((List<int> value) {
  //     int total = 0;
  //     for (var element in value) {
  //       total += element;
  //     }
  //
  //     setState(() {
  //       result = total.toString();
  //     });
  //   });
  // }
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
                // ✅ aktifkan loading saat tombol ditekan
                setState(() {
                  isLoading = true;
                  result = '';
                });

                // --- kamu bisa pilih fungsi mana yang mau dijalankan di sini ---
                // await count();        // PRAKTIKUM 2
                // await getNumber();    // PRAKTIKUM 3
                returnFG();        // PRAKTIKUM 4 (aktif sekarang)

                // ✅ matikan loading setelah Future selesai
                setState(() {
                  isLoading = false;
                });
              },
            ),
            const Spacer(),
            Text(result),
            const Spacer(),
            // ✅ loading hanya muncul saat isLoading = true
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
