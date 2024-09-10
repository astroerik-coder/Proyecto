class Card {
  List<Datum> data;

  Card({
    required this.data,
  });

  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
      data:
          (json['data'] as List).map((datum) => Datum.fromJson(datum)).toList(),
    );
  }
}

class Datum {
  int id;
  String name;
  String type;
  String humanReadableCardType;
  String frameType;
  String desc;
  String race;
  String archetype;
  String ygoprodeckUrl;
  List<CardSet> cardSets;
  List<CardImage> cardImages;
  List<CardPrice> cardPrices;

  Datum({
    required this.id,
    required this.name,
    required this.type,
    required this.humanReadableCardType,
    required this.frameType,
    required this.desc,
    required this.race,
    required this.archetype,
    required this.ygoprodeckUrl,
    required this.cardSets,
    required this.cardImages,
    required this.cardPrices,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      humanReadableCardType: json['humanReadableCardType'],
      frameType: json['frameType'],
      desc: json['desc'],
      race: json['race'],
      archetype: json['archetype'] ?? '', // Manejo de null en arquetipo
      ygoprodeckUrl: json['ygoprodeck_url'],
      cardSets: (json['card_sets'] as List)
          .map((set) => CardSet.fromJson(set))
          .toList(),
      cardImages: (json['card_images'] as List)
          .map((image) => CardImage.fromJson(image))
          .toList(),
      cardPrices: (json['card_prices'] as List)
          .map((price) => CardPrice.fromJson(price))
          .toList(),
    );
  }
}

class CardImage {
  int id;
  String imageUrl;
  String imageUrlSmall;
  String imageUrlCropped;

  CardImage({
    required this.id,
    required this.imageUrl,
    required this.imageUrlSmall,
    required this.imageUrlCropped,
  });

  factory CardImage.fromJson(Map<String, dynamic> json) {
    return CardImage(
      id: json['id'],
      imageUrl: json['image_url'],
      imageUrlSmall: json['image_url_small'],
      imageUrlCropped: json['image_url_cropped'],
    );
  }
}

class CardPrice {
  String cardmarketPrice;
  String tcgplayerPrice;
  String ebayPrice;
  String amazonPrice;
  String coolstuffincPrice;

  CardPrice({
    required this.cardmarketPrice,
    required this.tcgplayerPrice,
    required this.ebayPrice,
    required this.amazonPrice,
    required this.coolstuffincPrice,
  });

  factory CardPrice.fromJson(Map<String, dynamic> json) {
    return CardPrice(
      cardmarketPrice: json['cardmarket_price'],
      tcgplayerPrice: json['tcgplayer_price'],
      ebayPrice: json['ebay_price'],
      amazonPrice: json['amazon_price'],
      coolstuffincPrice: json['coolstuffinc_price'],
    );
  }
}

class CardSet {
  String setName;
  String setCode;
  String setRarity;
  String setRarityCode;
  String setPrice;

  CardSet({
    required this.setName,
    required this.setCode,
    required this.setRarity,
    required this.setRarityCode,
    required this.setPrice,
  });

  factory CardSet.fromJson(Map<String, dynamic> json) {
    return CardSet(
      setName: json['set_name'],
      setCode: json['set_code'],
      setRarity: json['set_rarity'],
      setRarityCode: json['set_rarity_code'],
      setPrice: json['set_price'],
    );
  }
}
