import 'package:flutter/material.dart';
import 'package:tugaspraktikum4/dummy/home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Good Evening ✨',
          style: TextStyle(
            fontSize: 28,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(120),
              child: CircleAvatar(
                child: Image.asset(
                  'assets/profiles/profiles.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          18,
        ),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Text(
              'Followed Artist',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(followed.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: followed[index],
                  );
                }),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recently Played',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'See All',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white70,
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(recent.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: recent[index],
                  );
                }),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Top Daily Playlists',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'See All',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white70,
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 12),
            ...List.generate(
              playlists.length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: playlists[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
