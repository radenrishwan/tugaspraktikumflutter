import 'dart:convert';
import 'dart:developer';

import 'package:otakudesu/data/models/web//anime.dart';
import 'package:http/http.dart' as http;
import 'package:otakudesu/data/models/web//anime_detail.dart';
import 'package:otakudesu/data/models/web//anime_genre.dart';
import 'package:otakudesu/data/models/web//anime_list.dart';
import 'package:otakudesu/data/models/web//episode.dart';
import 'package:otakudesu/data/models/web//episode_detail.dart';

class AnimeRepository {
  static final AnimeRepository _instance = AnimeRepository._();

  factory AnimeRepository() {
    return _instance;
  }

  AnimeRepository._();

  Future<List<Anime>> findHomePage() async {
    final List<Anime> result = [];

    try {
      final response = await http.get(Uri.parse('https://scraping-2wepigvexa-et.a.run.app/api/home'));

      if (response.statusCode > 200) {
        // TODO: handle error
        log('error : ${response.statusCode}');
      }

      final data = jsonDecode(response.body)['data'] as List<dynamic>;
      for (var element in data) {
        result.add(Anime.fromJson(element));
      }
    } catch (e) {
      throw Exception(e);
    }

    return result;
  }

  Future<AnimeDetail> findAnimeDetail(String id) async {
    AnimeDetail result = AnimeDetail(
      id: '',
      title: '',
      thumbnail: '',
      japaneseTitle: '',
      score: '',
      producer: '',
      type: '',
      status: '',
      duration: '',
      releaseDate: '',
      studio: '',
      genre: '',
      synopsis: '',
    );

    try {
      final response = await http.get(Uri.parse('https://scraping-2wepigvexa-et.a.run.app/api/anime/$id'));

      if (response.statusCode > 200) {
        log('error : ${response.statusCode}');
      }

      final data = jsonDecode(response.body)['data'] as Map<String, dynamic>;
      result = AnimeDetail.fromJson(data);

      data['episode'].forEach((element) {
        result.episode.add(Episode.fromJson(element));
      });
    } catch (e) {
      throw Exception(e);
    }

    return result;
  }

  Future<EpisodeDetail> findEpisodeDetail(String id) async {
    var result = EpisodeDetail(
      id: '',
      title: '',
      streamUrl: '',
      downloadUrls: [],
    );

    try {
      final response = await http.get(Uri.parse('https://scraping-2wepigvexa-et.a.run.app/api/episode/$id'));

      if (response.statusCode > 200) {
        log('error : ${response.statusCode}');
      }

      final data = jsonDecode(response.body)['data'] as Map<String, dynamic>;
      result = EpisodeDetail.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }

    return result;
  }

  Future<List<AnimeList>> findAnimeList() async {
    final List<AnimeList> result = [];

    try {
      final response = await http.get(Uri.parse('https://scraping-2wepigvexa-et.a.run.app/api/anime-list'));

      if (response.statusCode > 200) {
        log('error : ${response.statusCode}');
      }

      final data = jsonDecode(response.body)['data'] as List<dynamic>;
      for (var element in data) {
        result.add(AnimeList.fromJson(element));
      }
    } catch (e) {
      throw Exception(e);
    }

    return result;
  }

  Future<List<AnimeGenre>> findAnimeByGenre(String genre, int page) async {
    final List<AnimeGenre> result = [];

    try {
      final response =
          await http.get(Uri.parse('https://scraping-2wepigvexa-et.a.run.app/api/anime/genre/$genre?page=$page'));

      if (response.statusCode > 200) {
        // TODO: handle error
        log('error : ${response.statusCode}');
      }

      final data = jsonDecode(response.body)['data'] as List<dynamic>;
      for (var element in data) {
        result.add(AnimeGenre.fromJson(element));
      }
    } catch (e) {
      throw Exception(e);
    }

    return result;
  }

  Future<List<Anime>> findOnGoingAnime(int page) async {
    final List<Anime> result = [];

    try {
      final response =
          await http.get(Uri.parse('https://scraping-2wepigvexa-et.a.run.app/api/anime/ongoing?page=$page'));

      if (response.statusCode > 200) {
        // TODO: handle error
        log('error : ${response.statusCode}');
      }

      final data = jsonDecode(response.body)['data'];

      if (data == null) {
        return result;
      }

      for (var element in data as List<dynamic>) {
        result.add(Anime.fromJson(element));
      }
    } catch (e) {
      throw Exception(e);
    }

    return result;
  }

  Future<List<Anime>> findCompleteAnime(int page) async {
    final List<Anime> result = [];

    try {
      final response =
          await http.get(Uri.parse('https://scraping-2wepigvexa-et.a.run.app/api/anime/complete?page=$page'));

      if (response.statusCode > 200) {
        // TODO: handle error
        log('error : ${response.statusCode}');
      }

      final data = jsonDecode(response.body)['data'];

      if (data == null) {
        return result;
      }

      for (var element in data as List<dynamic>) {
        result.add(Anime.fromJson(element));
      }
    } catch (e) {
      throw Exception(e);
    }

    return result;
  }
}
