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
  String? type; // Hacemos que este campo sea opcional
  String? humanReadableCardType; // Opcional
  String? frameType; // Opcional
  String? desc; // Opcional
  String? race; // Opcional
  String? archetype; // Opcional
  String? ygoprodeckUrl; // Opcional
  List<CardSet>? cardSets; // Lista opcional
  List<CardImage>? cardImages; // Lista opcional
  List<CardPrice>? cardPrices; // Lista opcional

  Datum({
    required this.id,
    required this.name,
    this.type,
    this.humanReadableCardType,
    this.frameType,
    this.desc,
    this.race,
    this.archetype,
    this.ygoprodeckUrl,
    this.cardSets,
    this.cardImages,
    this.cardPrices,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json['id'],
      name: json['name'] ?? 'Unknown', // Valor por defecto si es null
      type: json['type'] ?? 'Unknown', // Manejo de null
      humanReadableCardType: json['humanReadableCardType'] ?? 'Unknown',
      frameType: json['frameType'] ?? 'Unknown',
      desc: json['desc'] ?? 'No description available',
      race: json['race'] ?? 'Unknown',
      archetype: json['archetype'], // Puede ser null
      ygoprodeckUrl: json['ygoprodeck_url'], // Puede ser null
      cardSets: (json['card_sets'] != null)
          ? (json['card_sets'] as List)
              .map((set) => CardSet.fromJson(set))
              .toList()
          : null, // Lista opcional
      cardImages: (json['card_images'] != null)
          ? (json['card_images'] as List)
              .map((image) => CardImage.fromJson(image))
              .toList()
          : null, // Lista opcional
      cardPrices: (json['card_prices'] != null)
          ? (json['card_prices'] as List)
              .map((price) => CardPrice.fromJson(price))
              .toList()
          : null, // Lista opcional
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
      imageUrl:
          json['image_url'] ?? '', // Si es null, devolvemos un string vacío
      imageUrlSmall: json['image_url_small'] ?? '',
      imageUrlCropped: json['image_url_cropped'] ?? '',
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
      cardmarketPrice: json['cardmarket_price'] ?? '0.00', // Valor por defecto
      tcgplayerPrice: json['tcgplayer_price'] ?? '0.00',
      ebayPrice: json['ebay_price'] ?? '0.00',
      amazonPrice: json['amazon_price'] ?? '0.00',
      coolstuffincPrice: json['coolstuffinc_price'] ?? '0.00',
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
      setName:
          json['set_name'] ?? 'Unknown', // Si es null, devolvemos 'Unknown'
      setCode: json['set_code'] ?? 'Unknown',
      setRarity: json['set_rarity'] ?? 'Unknown',
      setRarityCode: json['set_rarity_code'] ?? 'Unknown',
      setPrice: json['set_price'] ?? '0.00', // Valor por defecto si es null
    );
  }
}
