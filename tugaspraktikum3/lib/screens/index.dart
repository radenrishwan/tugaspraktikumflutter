import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:tugaspraktikum4/screens/discover.dart';
import 'package:tugaspraktikum4/screens/home.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int _selectedIndex = 0;

  final _widgetOptions = [
    const HomeScreen(),
    const DiscoverScreen(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(LineariconsFree.home),
            backgroundColor: Colors.black,
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Typicons.compass),
            backgroundColor: Colors.black,
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(LineariconsFree.music_note),
            backgroundColor: Colors.black,
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(LineariconsFree.cog_2),
            backgroundColor: Colors.black,
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        onTap: (value) {
          setState(() {
            setState(() {
              _selectedIndex = value;
            });
          });
        },
      ),
    );
  }
}
