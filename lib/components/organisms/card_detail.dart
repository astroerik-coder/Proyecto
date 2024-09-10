import 'package:flutter/material.dart';
import '../../models/card_model.dart';
import '../atoms/app_style.dart';
import '../atoms/styled_text.dart';
import '../atoms/card_image_atom.dart';
import '../atoms/card_info_container_atom.dart';
import '../atoms/card_detail_text_atom.dart';
import '../molecules/card_list_section.dart';

class CardDetail extends StatelessWidget {
  final Datum card;

  const CardDetail({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(card.name, style: const TextStyle(color: Colors.white)),
        backgroundColor: AppStyle.primaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      backgroundColor: Colors.transparent,
                      child: InteractiveViewer(
                        child: Image.network(
                          card.cardImages != null && card.cardImages!.isNotEmpty
                              ? card.cardImages![0].imageUrl
                              : 'https://via.placeholder.com/250',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  );
                },
                child: CardImageAtom(
                  imageUrl:
                      card.cardImages != null && card.cardImages!.isNotEmpty
                          ? card.cardImages![0].imageUrl
                          : null,
                  height: 250.0,
                  width: 180.0,
                ),
              ),
            ),
            const SizedBox(height: 24.0),

            CardInfoContainerAtom(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyledText(
                    text: card.name,
                    style: AppStyle.headingStyle.copyWith(
                      fontSize: 24,
                      color: AppStyle.accentColor,
                    ),
                  ),
                  Divider(color: Colors.grey[300], height: 20.0),
                  CardDetailTextAtom(label: "ID", value: card.id.toString()),
                  CardDetailTextAtom(label: "Tipo", value: card.type),
                  CardDetailTextAtom(
                      label: "Tipo legible", value: card.humanReadableCardType),
                  CardDetailTextAtom(
                      label: "Frame Type", value: card.frameType),
                ],
              ),
            ),
            const SizedBox(height: 24.0),

            CardInfoContainerAtom(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyledText(
                    text: card.desc ?? 'No description available',
                    style: AppStyle.subheadingStyle,
                  ),
                  const SizedBox(height: 16.0),
                  CardDetailTextAtom(label: "Raza", value: card.race),
                  if (card.archetype != null && card.archetype!.isNotEmpty)
                    CardDetailTextAtom(
                        label: "Arquetipo", value: card.archetype),
                ],
              ),
            ),
            const SizedBox(height: 24.0),

            // Conjuntos de cartas
            if (card.cardSets != null && card.cardSets!.isNotEmpty)
              CardListSection(
                title: "Conjuntos:",
                items: card.cardSets!.map((set) {
                  return "${set.setName} (${set.setCode}) - Rareza: ${set.setRarity} Precio: \$${set.setPrice}";
                }).toList(),
              ),

            // Precios
            if (card.cardPrices != null && card.cardPrices!.isNotEmpty)
              CardListSection(
                title: "Precios:",
                items: [
                  "CardMarket: \$${card.cardPrices![0].cardmarketPrice}",
                  "TCGPlayer: \$${card.cardPrices![0].tcgplayerPrice}",
                  "eBay: \$${card.cardPrices![0].ebayPrice}",
                  "Amazon: \$${card.cardPrices![0].amazonPrice}",
                  "CoolStuffInc: \$${card.cardPrices![0].coolstuffincPrice}",
                ],
              ),
          ],
        ),
      ),
      backgroundColor: AppStyle.primaryColor,
    );
  }
}
