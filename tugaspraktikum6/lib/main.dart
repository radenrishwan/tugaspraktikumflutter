import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugaspraktikum6/constant/color.dart';
import 'package:tugaspraktikum6/data/facade/theme_mode.dart';
import 'package:tugaspraktikum6/provider/theme_mode.dart';
import 'package:tugaspraktikum6/screen/home.dart';
import 'package:tugaspraktikum6/provider/note.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NoteProvider()),
        ChangeNotifierProvider(create: (_) => ThemeModeProvider()),
      ],
      child: const InitialApp(),
    ),
  );
}

class InitialApp extends StatefulWidget {
  const InitialApp({super.key});

  @override
  State<InitialApp> createState() => _InitialAppState();
}

class _InitialAppState extends State<InitialApp> {
  final ThemeModeFacade _themeModeFacade = ThemeModeFacade();

  @override
  void initState() {
    super.initState();
    _themeModeFacade.getThemeMode().then((value) => context.read<ThemeModeProvider>().setDarkMode(value));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModeProvider>(
      builder: (context, provider, _) {
        log(provider.darkMode.toString());
        return MaterialApp(
          title: 'Simple Note Application',
          home: const HomeScreen(),
          theme: ThemeData(useMaterial3: true).copyWith(
            primaryColor: kPrimaryColor,
            appBarTheme: const AppBarTheme(
              backgroundColor: kPrimaryColor,
              foregroundColor: Colors.white,
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
          darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
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
          themeMode: provider.darkMode ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
