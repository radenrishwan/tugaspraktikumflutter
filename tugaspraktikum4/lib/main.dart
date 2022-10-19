import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugaspraktikum4/screens/splash.dart';

void main() {
  runApp(const InitialApp());
}

class InitialApp extends StatelessWidget {
  const InitialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.notoSansTextTheme().apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        primaryColor: Colors.green,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
        ),
        scaffoldBackgroundColor: Colors.black,
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.green,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.greenAccent.shade400),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.greenAccent.shade400,
          unselectedItemColor: Colors.white38,
          elevation: 0,
          showSelectedLabels: false,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
