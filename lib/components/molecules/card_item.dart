import 'package:flutter/material.dart';
import '../atoms/app_style.dart';
import '../../models/card_model.dart';

class CardItem extends StatelessWidget {
  final CardModel card;

  const CardItem({Key? key, required this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: EdgeInsets.all(12.0),
      decoration: AppStyle.cardDecoration,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen de la carta
          Image.network(
            card.imageUrl,
            height: 100,
            width: 70,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 12.0),
          // Información de la carta
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  card.name,
                  style: AppStyle.cardTitleStyle,
                ),
                SizedBox(height: 4.0),
                Text(
                  card.desc,
                  style: AppStyle.cardDescriptionStyle,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
