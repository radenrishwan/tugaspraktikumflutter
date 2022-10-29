import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:otakudesu/data/repository/anime_repository.dart';
import 'package:otakudesu/helper/constant.dart';
import 'package:otakudesu/modules/homepage/bloc/anime_complete/anime_complete_bloc.dart';
import 'package:otakudesu/modules/homepage/bloc/anime_ongoing/anime_on_going_bloc.dart';
import 'package:otakudesu/modules/homepage/widget/anime_card.dart';
import 'package:otakudesu/modules/homepage/widget/chip_option_widget.dart';
import 'package:otakudesu/modules/homepage/widget/title_widget.dart';
import 'package:otakudesu/widget/loading_widget.dart';
import 'package:otakudesu/widget/show_error_widget.dart';
import 'package:search_page/search_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Otakudesu"),
        actions: [
          IconButton(
            onPressed: () async {
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
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Padding(
        padding: kDefaultLargePaddingSize,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ChipOptionWidget(),
              TitleWidget(
                title: 'On-Going Anime',
                onPressed: () {
                  context.read<AnimeOnGoingBloc>().add(AnimeOnGoingFetched());
                  GoRouter.of(context).push('/anime/ongoing');
                },
              ),
              FutureBuilder(
                future: AnimeRepository().findHomePage(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Column(
                      children: const [
                        SizedBox(height: 200),
                        LoadingWidget(),
                      ],
                    );
                  }

                  if (snapshot.hasError) {
                    return Column(
                      children: [
                        const SizedBox(height: 100),
                        ShowErrorWidget(
                          onTap: () {},
                        ),
                      ],
                    );
                  }

                  final data = snapshot.data!;

                  if (snapshot.data == null) {
                    return const Center(
                      child: Text('No Data'),
                    );
                  }

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        childAspectRatio: 0.75,
                        crossAxisSpacing: kDefaultSmallPaddingSize.vertical,
                        mainAxisSpacing: kDefaultSmallPaddingSize.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(
                          data.length ~/ 2,
                          (index) => AnimeCard(
                            anime: data[index],
                            onTap: () {
                              GoRouter.of(context).push('/anime/${data[index].id}');
                            },
                          ),
                        ),
                      ),
                      TitleWidget(
                        title: 'Complete Anime',
                        onPressed: () {
                          context.read<AnimeCompleteBloc>().add(AnimeCompleteFetched());
                          GoRouter.of(context).push('/anime/complete');
                        },
                      ),
                      GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        childAspectRatio: 0.75,
                        crossAxisSpacing: kDefaultSmallPaddingSize.vertical,
                        mainAxisSpacing: kDefaultSmallPaddingSize.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(
                          data.length ~/ 2,
                          (index) {
                            return AnimeCard(
                              anime: data[index + data.length ~/ 2],
                              onTap: () {
                                GoRouter.of(context).push('/anime/${data[index * 2].id}');
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
