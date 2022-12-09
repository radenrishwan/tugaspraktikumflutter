import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugaspraktikum6/constant/color.dart';
import 'package:tugaspraktikum6/screen/home.dart';
import 'package:tugaspraktikum6/provider/note.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NoteProvider()),
      ],
      child: const InitialApp(),
    ),
  );
}

class InitialApp extends StatelessWidget {
  const InitialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Note Application with markdown support',
      home: const HomeScreen(),
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: kPrimaryColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: kPrimaryColor,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: kPrimaryColor,
        ),
        textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(kPrimaryColor),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
