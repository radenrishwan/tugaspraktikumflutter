class AnimeList {
  final String id;
  final String title;
  final String url;

  const AnimeList({
    required this.id,
    required this.title,
    required this.url,
  });

  factory AnimeList.fromJson(Map<String, dynamic> json) {
    return AnimeList(
      id: json['id'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
    );
  }

  @override
  String toString() {
    return 'AnimeList{id: $id, title: $title, url: $url}';
  }
}
