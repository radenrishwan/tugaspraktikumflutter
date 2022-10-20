import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otakudesu/data/repository/anime_repository.dart';
import 'package:otakudesu/helper/constant.dart';
import 'package:search_page/search_page.dart';

class ChipOptionWidget extends StatelessWidget {
  const ChipOptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () async {
            final animeList = await AnimeRepository().findAnimeList();

            // Getting data from anime-list
            showSearch(
              context: context,
              delegate: SearchPage(
                onQueryUpdate: print,
                items: animeList,
                searchLabel: 'Search Anime',
                suggestion: const Center(
                  child: Text('Search Anime'),
                ),
                failure: const Center(
                  child: Text('No Anime Found'),
                ),
                filter: (anime) => [anime.title],
                sort: (a, b) => a.title.compareTo(b.title),
                builder: (anime) => ListTile(
                  title: Text(anime.title),
                  onTap: () => GoRouter.of(context).push('/anime/${anime.id}'),
                ),
              ),
            );
          },
          child: const Chip(
            label: Text('Search'),
            padding: EdgeInsets.all(0),
          ),
        ),
        SizedBox(width: kDefaultLargePaddingSize.left),
        InkWell(
          onTap: () => GoRouter.of(context).push('/anime-list'),
          child: const Chip(
            label: Text('Anime List'),
            padding: EdgeInsets.all(0),
          ),
        ),
        SizedBox(width: kDefaultLargePaddingSize.left),
        InkWell(
          onTap: () {
            AnimeRepository().findAnimeByGenre('action', 1);
          },
          child: const Chip(
            label: Text('Genre List'),
            padding: EdgeInsets.all(0),
          ),
        ),
        SizedBox(width: kDefaultLargePaddingSize.left),
        const Chip(
          label: Text('Bookmark'),
          padding: EdgeInsets.all(0),
        ),
      ],
    );
  }
}
