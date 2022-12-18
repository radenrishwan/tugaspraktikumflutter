import 'package:flutter/material.dart';

class PriceCard extends StatelessWidget {
  final Widget leading;
  final String label;
  const PriceCard({super.key, required this.leading, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            leading,
            const SizedBox(width: 4),
            Text("\$$label"),
          ],
        ),
      ),
    );
  }
}
