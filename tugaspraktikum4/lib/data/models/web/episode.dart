class Episode {
  final String id;
  final String episode;
  final String url;
  final String uploadeDate;

  const Episode({
    required this.id,
    required this.episode,
    required this.url,
    required this.uploadeDate,
  });

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      id: json['id'],
      episode: json['episode'],
      url: json['url'],
      uploadeDate: json['upload_date'],
    );
  }

  @override
  String toString() {
    return 'Episode{id: $id, episode: $episode, url: $url, uploadeDate: $uploadeDate}';
  }
}
