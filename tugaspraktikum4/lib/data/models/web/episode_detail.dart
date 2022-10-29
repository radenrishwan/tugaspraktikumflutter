import 'package:otakudesu/data/models/web//download_url.dart';

class EpisodeDetail {
  final String id;
  final String title;
  final String streamUrl;
  List<DownloadURL> downloadUrls = [];

  EpisodeDetail({
    required this.id,
    required this.title,
    required this.streamUrl,
    required this.downloadUrls,
  });

  // from json
  factory EpisodeDetail.fromJson(Map<String, dynamic> json) {
    return EpisodeDetail(
      id: json['id'] as String,
      title: json['title'] as String,
      streamUrl: json['stream_url'] as String,
      downloadUrls: (json['download_urls'] as List).map((e) => DownloadURL.fromJson(e)).toList(),
    );
  }

  @override
  String toString() {
    return 'EpisodeDetail{id: $id, title: $title, streamUrl: $streamUrl,downloadUrls: $downloadUrls}';
  }
}
