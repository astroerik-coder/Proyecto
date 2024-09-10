import 'package:flutter/material.dart';
import '../../models/card_model.dart';
import '../atoms/app_style.dart';
import '../atoms/styled_text.dart';
import '../atoms/card_image_atom.dart';
import 'package:yugioh/components/organisms/card_detail.dart';

class CardItem extends StatelessWidget {
  final Datum card;

  const CardItem({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
            // Imagen de la carta
            Center(
              child: CardImageAtom(
                imageUrl: card.cardImages != null && card.cardImages!.isNotEmpty
                    ? card.cardImages![0].imageUrl
                    : null,
                height: screenHeight * 0.15,
                width: screenWidth * 0.16,
              ),
            ),
            SizedBox(width: screenWidth * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyledText(
                    text: card.name,
                    style: AppStyle.cardTitleStyle.copyWith(
                      fontSize: screenWidth * 0.05,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  StyledText(
                    text: card.desc ?? 'No description available',
                    style: AppStyle.cardDescriptionStyle.copyWith(
                      fontSize: screenWidth * 0.035,
                    ),
                    maxLines: 3,
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
