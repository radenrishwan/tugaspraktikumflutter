import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:otakudesu/data/repository/anime_repository.dart';
import 'package:otakudesu/helper/constant.dart';
import 'package:otakudesu/widget/loading_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class EpisodeDetailScreen extends StatelessWidget {
  final String id;
  final String title;
  const EpisodeDetailScreen({
    super.key,
    required this.id,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      body: FutureBuilder(
          future: AnimeRepository().findEpisodeDetail(id),
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

            final List<Widget> downloadWidget = List.generate(data.downloadUrls.length, (index) {
              return ListTile(
                title: Text(data.downloadUrls[index].host),
                subtitle: Text(data.downloadUrls[index].size),
                trailing: Text(data.downloadUrls[index].resolution),
                onTap: () async {
                  final uri = Uri.parse(data.downloadUrls[index].url);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  } else {
                    // can't launch url
                  }
                },
              );
            });

            return ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: InAppWebView(
                    initialUrlRequest: URLRequest(
                      url: Uri.parse(
                        data.streamUrl,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: kDefaultLargePaddingSize,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: kDefaultLargePaddingSize.left),
                      Text(
                        'Download link',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: kDefaultSmallPaddingSize.left),
                      Divider(
                        height: 10,
                        color: kDefaultColor,
                      ),
                      SizedBox(height: kDefaultSmallPaddingSize.left),
                      ...downloadWidget,
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
