import 'dart:convert';

import 'package:tugaspraktikum8/models/card.dart';
import 'package:http/http.dart' as http;

class CardService {
  Future<List<Card>> findAll(int page) async {
    final List<Card> cards = [];
    http.Response response = await http.get(
      Uri.parse('https://db.ygoprodeck.com/api/v7/cardinfo.php?num=10&offset=$page'),
    );

    final result = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (var item in result['data']) {
        cards.add(Card.fromJson(item));
      }
    } else {
      throw Exception('Failed to load data');
    }

    return cards;
  }
}
