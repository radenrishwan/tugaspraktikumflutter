import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:otakudesu/data/models/web//anime_list.dart';
import 'package:otakudesu/data/repository/anime_repository.dart';
import 'package:otakudesu/helper/constant.dart';
import 'package:otakudesu/widget/loading_widget.dart';

class AnimeListScreen extends StatelessWidget {
  const AnimeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anime List'),
      ),
      body: Padding(
        padding: kDefaultLargePaddingSize.copyWith(top: 0),
        child: FutureBuilder(
            future: AnimeRepository().findAnimeList(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingWidget();
              }
              final data = snapshot.data!;

              if (snapshot.data == null) {
                return const Center(
                  child: Text('No Data'),
                );
              }

              return GroupedListView<dynamic, String>(
                elements: data,
                groupBy: (element) {
                  final anime = element as AnimeList;
                  return anime.id[0].toString().toUpperCase();
                },
                groupSeparatorBuilder: (String groupByValue) => SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: kDefaultLargePaddingSize.left),
                      Text(
                        groupByValue,
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Divider(
                        height: 10,
                        color: kDefaultColor,
                      )
                    ],
                  ),
                ),
                itemBuilder: (context, dynamic element) {
                  final anime = element as AnimeList;

                  return TextButton(
                    style: const ButtonStyle(alignment: Alignment.centerLeft),
                    child: Text(
                      anime.title,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    onPressed: () => GoRouter.of(context).push('/anime/${element.id}'),
                  );
                },
                order: GroupedListOrder.ASC, // optional
              );
            }),
      ),
    );
  }
}
