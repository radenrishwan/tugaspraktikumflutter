import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otakudesu/data/repository/anime_repository.dart';
import 'package:otakudesu/helper/constant.dart';
import 'package:otakudesu/widget/loading_widget.dart';
import 'package:otakudesu/widget/text_detail_card.dart';

class AnimeDetailScreen extends StatelessWidget {
  final String id;
  const AnimeDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anime Detail'),
      ),
      body: FutureBuilder(
          future: AnimeRepository().findAnimeDetail(id),
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

            return ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Stack(
                    children: [
                      Image.network(
                        data.thumbnail,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.black.withOpacity(0.3),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: kDefaultLargePaddingSize,
                            color: Colors.black.withOpacity(0.5),
                            width: double.infinity,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.title,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                SizedBox(height: kDefaultSmallPaddingSize.top),
                                Text(data.japaneseTitle), // TODO:fix japanese title
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: kDefaultLargePaddingSize.left),
                Padding(
                  padding: kDefaultLargePaddingSize.copyWith(top: 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Detail',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: kDefaultSmallPaddingSize.left),
                      Divider(
                        height: 10,
                        color: kDefaultColor,
                      ),
                      SizedBox(height: kDefaultSmallPaddingSize.left),
                      TextDetailCard(title: 'Genre', value: data.genre),
                      SizedBox(height: kDefaultSmallPaddingSize.left),
                      TextDetailCard(title: 'Score', value: data.score),
                      SizedBox(height: kDefaultSmallPaddingSize.left),
                      TextDetailCard(title: 'Type', value: data.type),
                      SizedBox(height: kDefaultSmallPaddingSize.left),
                      TextDetailCard(title: 'Status', value: data.status),
                      SizedBox(height: kDefaultSmallPaddingSize.left),
                      TextDetailCard(title: 'Producer', value: data.producer),
                      SizedBox(height: kDefaultSmallPaddingSize.left),
                      TextDetailCard(title: 'Realease Date', value: data.releaseDate),
                      SizedBox(height: kDefaultSmallPaddingSize.left),
                      TextDetailCard(title: 'Studio', value: data.studio),
                      SizedBox(height: kDefaultSmallPaddingSize.left),
                      TextDetailCard(title: 'Duration', value: data.duration),
                      SizedBox(height: kDefaultLargePaddingSize.left),
                      Text(
                        'Synopsis',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: kDefaultSmallPaddingSize.left),
                      Divider(
                        height: 10,
                        color: kDefaultColor,
                      ),
                      SizedBox(height: kDefaultSmallPaddingSize.left),
                      Text(
                        (data.synopsis == '') ? 'No Synopsis' : data.synopsis,
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: kDefaultLargePaddingSize.left),
                      Text(
                        'List Episode',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: kDefaultSmallPaddingSize.left),
                      Divider(
                        height: 10,
                        color: kDefaultColor,
                      ),
                      SizedBox(height: kDefaultSmallPaddingSize.left),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                height: MediaQuery.of(context).size.height * 0.5,
                                child: ListView.builder(
                                  itemCount: data.episode.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(
                                        data.episode[index].episode,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      subtitle: Text(data.episode[index].uploadeDate),
                                      onTap: () => GoRouter.of(context).push(
                                        '/episode/${data.episode[index].id}/${data.episode[index].episode}',
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                        child: const Text(
                          'Click to show episode',
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
