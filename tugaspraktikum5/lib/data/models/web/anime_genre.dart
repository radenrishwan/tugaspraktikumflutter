class AnimeGenre {
  final String id;
  final String title;
  final String thumbnail;
  final String url;
  final String episode;
  final List<String> genre;
  final String score;

  const AnimeGenre(
      {required this.id,
      required this.title,
      required this.thumbnail,
      required this.url,
      required this.episode,
      required this.genre,
      required this.score});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'thumbnail': thumbnail,
      'url': url,
      'episode': episode,
      'score': score,
      'genre': genre,
    };
  }

  factory AnimeGenre.fromJson(Map<String, dynamic> json) {
    return AnimeGenre(
      id: json['id'],
      title: json['title'],
      thumbnail: json['thumbnail'],
      url: json['url'],
      episode: json['episode'],
      score: json['score'],
      genre: json['genre'].cast<String>(),
    );
  }

  @override
  toString() => '$runtimeType($id, $title, $thumbnail, $url, $episode, $genre, $score)';
}
