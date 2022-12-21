import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugaspraktikum8/provider/card_provider.dart';
import 'package:tugaspraktikum8/screen/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CardProvider()),
      ],
      builder: (context, child) {
        return const InitialApp();
      },
    ),
  );
}

class InitialApp extends StatelessWidget {
  const InitialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
