import 'package:flutter/material.dart';
import 'package:otakudesu/data/models/web//anime.dart';

class AnimeCard extends StatelessWidget {
  final Anime anime;
  final VoidCallback onTap;
  const AnimeCard({super.key, required this.anime, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.network(
              anime.thumbnail,
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
              width: double.infinity,
              height: 40,
              color: Colors.black.withOpacity(0.4),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Center(
                child: Text(
                  anime.title,
                  style: Theme.of(context).textTheme.titleSmall,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              right: 0,
              child: Container(
                color: Colors.black.withOpacity(0.7),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  anime.episode,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
