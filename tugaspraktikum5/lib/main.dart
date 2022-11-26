import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const InitialApp());
}

class InitialApp extends StatelessWidget {
  const InitialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          bool isFirstOpen = snapshot.data!.getBool('isFirstOpen') ?? true;

          return isFirstOpen ? const SplashScreen() : const HomeScreen();
        },
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        snapshot.data!.setBool('isFirstOpen', false);

        return Scaffold(
          body: const Center(
            child: Text('Welcome to my app'),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.all(24),
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: const Text('Go to HomePage'),
            ),
          ),
        );
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(radius: 60),
            const SizedBox(height: 12),
            Text(
              'Raden Mohamad Rishwan',
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 12),
            Text(
              'Indonesia 🇮🇩',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 12),
            const Text(
              'Click the reset button on the bottom right \nif you want to see the splash screen again',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();

          prefs.setBool('isFirstOpen', true);
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
