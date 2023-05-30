import 'package:flutter/material.dart';

const startAlignment = Alignment.topCenter;
const endAlignment = Alignment.bottomCenter;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 181, 216, 214),
          Color.fromARGB(255, 224, 242, 241),
        ], begin: startAlignment, end: endAlignment)),
        child: const Center(
          child: Text(
            "Hello World",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
        ),
      )),
    );
  }
}
