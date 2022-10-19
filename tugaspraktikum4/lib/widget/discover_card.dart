import 'package:flutter/material.dart';

class DiscoverCard extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;
  final Image image;
  final VoidCallback onTap;
  const DiscoverCard({
    super.key,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
