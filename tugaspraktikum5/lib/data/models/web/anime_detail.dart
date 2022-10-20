import 'package:otakudesu/data/models/web//episode.dart';

class AnimeDetail {
  final String id;
  final String title;
  final String thumbnail;
  final String japaneseTitle;
  final String score;
  final String producer;
  final String type;
  final String status;
  final String duration;
  final String releaseDate;
  final String studio;
  final String genre;
  final String synopsis;
  List<Episode> episode = [];

  AnimeDetail({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.japaneseTitle,
    required this.score,
    required this.producer,
    required this.type,
    required this.status,
    required this.duration,
    required this.releaseDate,
    required this.studio,
    required this.genre,
    required this.synopsis,
  });

  factory AnimeDetail.fromJson(Map<String, dynamic> json) {
    return AnimeDetail(
      id: json['id'],
      title: json['title'],
      thumbnail: json['thumbnail'],
      japaneseTitle: json['japanese_title'],
      score: json['score'],
      producer: json['producer'],
      type: json['type'],
      status: json['status'],
      duration: json['duration'],
      releaseDate: json['realease_date'],
      studio: json['studio'],
      genre: json['genre'],
      synopsis: json['synopsis'],
    );
  }

  @override
  String toString() {
    return 'AnimeDetail{id: $id, title: $title, thumbnail: $thumbnail, japaneseTitle: $japaneseTitle, score: $score, producer: $producer, type: $type, status: $status, duration: $duration, releaseDate: $releaseDate, studio: $studio, genre: $genre, synopsis: $synopsis, episode: $episode}';
  }
}
