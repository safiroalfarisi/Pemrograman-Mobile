import 'package:flutter/material.dart';
import 'package:stream_firo/stream.dart';
import 'dart:async';
import 'dart:math';

void main () {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Hilmi',
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
      ),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  // praktikum 1
  Color bgColor = Colors.blueGrey;
  late ColorStream colorStream;

  // praktikum 2
  int lastNumber = 0;
  late StreamController numberStreamController;
  late NumberStream numberStream;

  // praktikum 3
  late StreamTransformer transformer;

  // praktikum 4
  late StreamSubscription subscription;

  // praktikum 5
  late StreamSubscription subscription2;
  String values =  '';

  void changeColor() async {
    // await for (var eventColor in colorStream.getColors()) {
    //   setState(() {
    //     bgColor = eventColor;
    //   });
    // }
    colorStream.getColors().listen((eventColor) {
      setState(() {
        bgColor = eventColor;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(('Stream Firo')),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(values),
            ElevatedButton(
                onPressed: () => addRandomNumber(),
                child: Text('Start Random Number')),
            ElevatedButton(
              onPressed: () => stopStream(),
              child: Text('Stop Subsription'),
            )
          ],
        ),
      )
    );
  }

  @override
  void initState() {
    numberStream = NumberStream();
    numberStreamController = numberStream.controller;
    Stream stream = numberStreamController.stream.asBroadcastStream();
    // stream.listen((event) {
    //   setState(() {
    //     lastNumber = event;
    //   });
    // }).onError((error) {
    //   setState(() {
    //     lastNumber = -1;
    //   });
    // });

    // transformer = StreamTransformer<int, int>.fromHandlers(
    //   handleData: (value, sink) {
    //     sink.add(value * 10 );
    //   },
    //   handleError: (error, trace, sink) {
    //     sink.add(-1);
    //   },
    //   handleDone: (sink) => sink.close()
    // );
    //
    // stream.transform(transformer).listen((event) {
    //   setState(() {
    //     lastNumber = event;
    //   });
    // }). onError((error) {
    //   setState(() {
    //     lastNumber = -1;
    //   });
    // });

    subscription = stream.listen((event) {
      setState(() {
        values += '$event - ';
      });
    });

    subscription.onError((event) {
      setState(() {
        values += '$event - ';
      });
    });

    subscription.onDone(() {
      print('onDone was called');
    });

    super.initState();
  }

  @override
  void dispose() {
    numberStreamController.close();
    subscription.cancel();
    super.dispose();
  }

  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10);
    // numberStream.addNumberToSink(myNum);
    // numberStream.addError();
    if (!numberStreamController.isClosed) {
      numberStream.addNumberToSink(myNum);
    } else {
      setState(() {
        lastNumber = -1;
      });
    }
  }

  void stopStream() {
    numberStreamController.close();
  }
}