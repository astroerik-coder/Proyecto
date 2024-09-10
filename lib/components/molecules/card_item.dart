import 'package:flutter/material.dart';
import 'package:yugioh/components/organisms/card_detail.dart';
import '../../models/card_model.dart';
import '../atoms/styled_text.dart';
import '../atoms/app_style.dart';
import '../atoms/card_image_atom.dart';

class CardItem extends StatelessWidget {
  final Datum card;

  const CardItem({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CardDetail(card: card),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        padding: const EdgeInsets.all(12.0),
        decoration: AppStyle.cardDecoration,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardImageAtom(
              imageUrl: (card.cardImages != null && card.cardImages!.isNotEmpty)
                  ? card.cardImages![0].imageUrl
                  : null,
              height: 100.0,
              width: 70.0,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyledText(
                    text: card.name,
                    style: AppStyle.cardTitleStyle,
                  ),
                  const SizedBox(height: 8.0),
                  StyledText(
                    text: card.desc ?? 'No description available',
                    style: AppStyle.cardDescriptionStyle,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
