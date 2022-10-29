class Anime {
  final String id;
  final String title;
  final String thumbnail;
  final String url;
  final String episode;

  const Anime({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.url,
    required this.episode,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'thumbnail': thumbnail,
      'url': url,
      'episode': episode,
    };
  }

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      id: json['id'],
      title: json['title'],
      thumbnail: json['thumbnail'],
      url: json['url'],
      episode: json['episode'],
    );
  }
}
