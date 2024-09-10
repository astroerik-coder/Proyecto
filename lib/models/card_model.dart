class CardModel {
  final int id;
  final String name;
  final String type;
  final String desc;
  final String imageUrl;
  final double price;

  CardModel({
    required this.id,
    required this.name,
    required this.type,
    required this.desc,
    required this.imageUrl,
    required this.price,
  });

  // Método factory para crear una instancia del modelo desde JSON
  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      desc: json['desc'],
      imageUrl: json['card_images'][0]['image_url'],
      price: double.parse(json['card_prices'][0]['tcgplayer_price']),
    );
  }
}
