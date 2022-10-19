import 'package:flutter/material.dart';

class FollowedAvatar extends StatelessWidget {
  const FollowedAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.network(
            'https://i.ibb.co/NCRbkq2/calum-1.jpg',
            fit: BoxFit.cover,
            width: 100,
          ),
        ),
        const SizedBox(height: 3),
        const Text(
          'Calum Scott',
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
