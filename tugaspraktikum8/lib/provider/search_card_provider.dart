import 'package:flutter/material.dart';
import 'package:tugaspraktikum8/models/card.dart' as model;
import 'package:tugaspraktikum8/services/card_service.dart';

class SearchCardProvider extends ChangeNotifier {
  List<model.Card> cards = [];
  int page = 1;
  final cardService = CardService();

  Future<void> fetchCards(String name) async {
    final ten = await cardService.findByName(name, page, 15);
    cards = [...cards, ...ten];

    if (cards.isEmpty) {
      page = 1;
    } else {
      page += 1;
    }

    notifyListeners();
  }
}
