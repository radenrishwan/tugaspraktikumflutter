import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tugaspraktikum8/models/card.dart';

// TODO: change to singleton object
class CardService {
  Future<List<Card>> findAll(int page, int num) async {
    final List<Card> cards = [];

    try {
      http.Response response = await http.get(
        Uri.parse('https://db.ygoprodeck.com/api/v7/cardinfo.php?num=$num&offset=$page'),
      );

      final result = jsonDecode(response.body);

      if (response.statusCode == 200) {
        for (var item in result['data']) {
          cards.add(Card.fromJson(item));
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      // log(error.toString()); // TODO: make a message pop up when error appear
      throw http.ClientException(error.toString());
    }

    return cards;
  }

  Future<List<Card>> findByName(String name, int page, int num) async {
    final List<Card> cards = [];

    try {
      http.Response response = await http.get(
        Uri.parse('https://db.ygoprodeck.com/api/v7/cardinfo.php?fname=$name&offset=$page&num=$num'),
      );

      final result = jsonDecode(response.body);

      if (response.statusCode == 200) {
        for (var item in result['data']) {
          cards.add(Card.fromJson(item));
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      // log(error.toString()); // TODO: make a message pop up when error appear
      throw http.ClientException(error.toString());
    }

    return cards;
  }
}
