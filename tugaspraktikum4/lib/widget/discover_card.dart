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
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_rounded,
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/illustrations/discover/discover-1.png',
            height: 165,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
