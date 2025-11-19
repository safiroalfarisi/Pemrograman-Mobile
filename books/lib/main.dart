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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future Demo Firo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: const FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({ super.key });

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = '';
  late Completer completer;

  // praktikum 1
  // Future<Response> getData() async {
  //   const authority = 'www.googleapis.com';
  //   const path = '/books/v1/volumes/516Mae9ot04C';
  //   Uri url = Uri.https(authority, path);
  //   return http.get(url);
  // }

  // praktikum 2
  // Future<int> returnOneAsync() async {
  //   await Future.delayed(const Duration(seconds: 3));
  //   return 1;
  // }
  // Future<int> returnTwoAsync() async {
  //   await Future.delayed(const Duration(seconds: 3));
  //   return 2;
  // }
  // Future<int> returnThreeAsync() async {
  //   await Future.delayed(const Duration(seconds: 3));
  //   return 3;
  // }

  // Future count() async {
  //   int total = 0;
  //   total = await returnOneAsync();
  //   total += await returnTwoAsync();
  //   total += await returnThreeAsync();
  //   setState(() {
  //     result = total.toString();
  //   });
  // }

  // praktikum 3
  Future getNumber() {
    completer = Completer<int> ();
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
      await new Future.delayed(const Duration(seconds: 5));
      completer.complete(42);
    } catch (_) {
      completer.completeError({});
    }
  }

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
              onPressed: () {
                setState(() {
                  // count();
                });
                // getData().then((value) {
                //   // result = value.body.toString().substring(0, 450);
                //   setState(() {
                //     result = value.toString();
                //   });
                // }).catchError((_) {
                //   result = 'An error occurred';
                //   setState(() {});
                // });
                getNumber().then((value) {
                  // result = value.body.toString().substring(0, 450);
                  setState(() {
                    result = value.toString();
                  });
                }).catchError((_) {
                  result = 'An error occurred';
                  setState(() {});
                });
              },
            ),
            const Spacer(),
            Text(result),
            const Spacer(),
            const CircularProgressIndicator(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}