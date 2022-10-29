import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';

class PlaylistCard extends StatelessWidget {
  const PlaylistCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl772AHySD_a0wLLb0emOGxcxJSr4W8FY7jw&usqp=CAU',
                  fit: BoxFit.cover,
                  height: 100,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Good Morning',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'By ',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        color: Colors.white70,
                      ),
                    ),
                    Text(
                      'Unwrap',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(width: 12),
                    Text(
                      '74 Songs',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                border: Border.all(
                  color: Colors.white70,
                  width: 0.5,
                ),
              ),
              child: const Icon(
                Typicons.down_small,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
