class Card {
  final String id;
  final String name;
  final String description;
  final String race;
  final String? type;
  String? archetype;
  String? attribute;
  int? atk;
  int? def;
  int? level;
  final List<CardSet>? cardSets;
  final List<CardImage> cardImages;
  final List<CardPrice> cardPrices;

  Card({
    required this.id,
    required this.name,
    required this.description,
    required this.race,
    this.type,
    this.archetype,
    this.atk,
    this.def,
    this.level,
    this.attribute,
    required this.cardSets,
    required this.cardImages,
    required this.cardPrices,
  });

  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
      id: json['id'].toString(),
      name: json['name'],
      description: json['desc'],
      race: json['race'],
      archetype: json['archetype'],
      type: json['type'],
      atk: json['atk'],
      def: json['def'],
      level: json['level'],
      attribute: json['attribute'],
      cardImages: (json['card_images'] as List).map((e) => CardImage.fromJson(e)).toList(),
      cardSets:
          (json['card_sets'] == null) ? null : (json['card_sets'] as List).map((e) => CardSet.fromJson(e)).toList(),
      cardPrices: (json['card_prices'] as List).map((e) => CardPrice.fromJson(e)).toList(),
    );
  }
}

class CardSet {
  final String name;
  final String code;
  final String rarity;
  final String rarityCode;
  final String price;

  CardSet({
    required this.name,
    required this.code,
    required this.rarity,
    required this.rarityCode,
    required this.price,
  });

  factory CardSet.fromJson(Map<String, dynamic> json) {
    return CardSet(
      name: json['set_name'],
      code: json['set_code'],
      rarity: json['set_rarity'],
      rarityCode: json['set_rarity_code'].toString(),
      price: json['set_price'].toString(),
    );
  }
}

class CardImage {
  final String id;
  final String url;
  final String smallUrl;

  CardImage({
    required this.id,
    required this.url,
    required this.smallUrl,
  });

  factory CardImage.fromJson(Map<String, dynamic> json) {
    return CardImage(
      id: json['id'].toString(),
      url: json['image_url'],
      smallUrl: json['image_url_small'],
    );
  }
}

class CardPrice {
  final String marketPrice;
  final String tcgplayerPrice;
  final String ebayPrice;
  final String amazonPrice;
  final String coolstuffincPrice;

  CardPrice({
    required this.marketPrice,
    required this.tcgplayerPrice,
    required this.ebayPrice,
    required this.amazonPrice,
    required this.coolstuffincPrice,
  });

  // from json
  factory CardPrice.fromJson(Map<String, dynamic> json) {
    return CardPrice(
      marketPrice: json['cardmarket_price'].toString(),
      tcgplayerPrice: json['tcgplayer_price'].toString(),
      ebayPrice: json['ebay_price'].toString(),
      amazonPrice: json['amazon_price'].toString(),
      coolstuffincPrice: json['coolstuffinc_price'].toString(),
    );
  }
}
