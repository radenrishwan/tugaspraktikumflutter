import 'package:flutter/material.dart';
import 'package:praktikum/playground.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Playground(),
      theme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark().copyWith(primary: Colors.greenAccent.shade100),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}