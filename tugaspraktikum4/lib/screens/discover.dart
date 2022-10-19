import 'package:flutter/material.dart';
import 'package:tugaspraktikum4/dummy/discover.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Discover'),
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
        padding: const EdgeInsets.all(18),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  size: 24,
                  color: Colors.white54,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Search..',
                fillColor: Colors.white12,
                filled: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Perfect for you',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              physics: const ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  perfect.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: perfect[index],
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              physics: const ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  discover.length,
                  (index) => discover[index],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
