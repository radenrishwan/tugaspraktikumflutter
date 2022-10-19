import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:tugaspraktikum4/screens/index.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 28, right: 8, top: 12),
                width: double.infinity,
                child: Image.asset(
                  'assets/illustrations/taylor.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.65,
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.black,
              ),
            ],
          ),
          Container(
            width: double.infinity,
            color: Colors.black38,
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 8,
                ),
                const Text(
                  'Millions of Musics',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Be the first to discover, play and\nshare your favorite track from\nemerging artists',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const IndexScreen(),
                    ),
                  ),
                  style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.all(32)),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(120),
                        ),
                      ),
                    ),
                  ),
                  child: const Icon(
                    Typicons.right_open_outline,
                    color: Colors.black,
                    size: 28,
                  ),
                ),
                const Spacer()
              ],
            ),
          )
        ],
      ),
    );
  }
}
