import 'package:flutter/material.dart';
import '../models/card_model.dart';
import '../components/atoms/app_style.dart';
import '../components/atoms/styled_text.dart';

class CardDetail extends StatelessWidget {
  final Datum card;

  const CardDetail({Key? key, required this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(card.name, style: TextStyle(color: Colors.white)),
        backgroundColor: AppStyle.primaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen de la carta con la opción de maximizarla al hacer click
            Center(
              child: GestureDetector(
                onTap: () {
                  // Al hacer tap en la imagen, se abre un diálogo con la imagen maximizada
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      backgroundColor: Colors.transparent, // Fondo transparente
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pop(); // Cerrar el diálogo al hacer tap en la imagen
                        },
                        child: InteractiveViewer(
                          child: Image.network(
                            // Verificamos si `cardImages` no es null y tiene al menos un elemento
                            card.cardImages != null &&
                                    card.cardImages!.isNotEmpty
                                ? card.cardImages![0].imageUrl
                                : 'https://via.placeholder.com/250', // Imagen placeholder
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppStyle.accentColor, width: 3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(
                    // Verificamos si `cardImages` no es null y tiene al menos un elemento
                    card.cardImages != null && card.cardImages!.isNotEmpty
                        ? card.cardImages![0].imageUrl
                        : 'https://via.placeholder.com/180x250', // Imagen placeholder
                    height: 250.0,
                    width: 180.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.0),

            // Sección de ID, tipo y detalles
            Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: AppStyle.secondaryColor
                    .withOpacity(0.5), // Fondo morado oscuro translúcido
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8.0,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyledText(
                    text: "ID: ${card.id}",
                    style: AppStyle.cardDescriptionStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(height: 8.0),
                  StyledText(
                    text: card.name,
                    style: AppStyle.headingStyle.copyWith(
                      fontSize: 24,
                      color: AppStyle.accentColor,
                    ),
                  ),
                  Divider(color: Colors.grey[300], height: 20.0),
                  StyledText(
                    text: "Tipo: ${card.type}",
                    style: AppStyle.cardDescriptionStyle,
                  ),
                  SizedBox(height: 8.0),
                  StyledText(
                    text: "Tipo legible: ${card.humanReadableCardType}",
                    style: AppStyle.cardDescriptionStyle,
                  ),
                  SizedBox(height: 8.0),
                  StyledText(
                    text: "Frame Type: ${card.frameType}",
                    style: AppStyle.cardDescriptionStyle,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.0),

            // Descripción y detalles adicionales
            Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: AppStyle.secondaryColor
                    .withOpacity(0.5), // Fondo morado oscuro translúcido
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8.0,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyledText(
                    text: card.desc ??
                        'No description available', // Usamos ?? para manejar null
                    style: AppStyle.subheadingStyle,
                  ),
                  SizedBox(height: 16.0),
                  StyledText(
                    text:
                        "Raza: ${card.race ?? 'Unknown'}", // También podemos manejar null aquí
                    style: AppStyle.cardDescriptionStyle,
                  ),
                  SizedBox(height: 8.0),
                  if (card.archetype != null && card.archetype!.isNotEmpty) ...[
                    StyledText(
                      text: "Arquetipo: ${card.archetype}",
                      style: AppStyle.cardDescriptionStyle,
                    ),
                  ],
                ],
              ),
            ),
            SizedBox(height: 24.0),

            // Conjuntos de cartas
            if (card.cardSets != null && card.cardSets!.isNotEmpty) ...[
              Text(
                "Conjuntos:",
                style: AppStyle.cardTitleStyle.copyWith(
                  fontSize: 18.0,
                  color: AppStyle.accentColor,
                ),
              ),
              Divider(color: Colors.grey[300], height: 20.0),
              Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: AppStyle.secondaryColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8.0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: card.cardSets!.map((set) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: StyledText(
                        text:
                            "${set.setName} (${set.setCode}) - Rareza: ${set.setRarity} Precio: \$${set.setPrice}",
                        style: AppStyle.cardDescriptionStyle,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
            SizedBox(height: 24.0),

            // Precios
            if (card.cardPrices != null && card.cardPrices!.isNotEmpty) ...[
              Text(
                "Precios:",
                style: AppStyle.cardTitleStyle.copyWith(
                  fontSize: 18.0,
                  color: AppStyle.accentColor,
                ),
              ),
              Divider(color: Colors.grey[300], height: 20.0),
              Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: AppStyle.secondaryColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8.0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StyledText(
                      text:
                          "CardMarket: \$${card.cardPrices![0].cardmarketPrice}",
                      style: AppStyle.cardDescriptionStyle,
                    ),
                    SizedBox(height: 8.0),
                    StyledText(
                      text:
                          "TCGPlayer: \$${card.cardPrices![0].tcgplayerPrice}",
                      style: AppStyle.cardDescriptionStyle,
                    ),
                    SizedBox(height: 8.0),
                    StyledText(
                      text: "eBay: \$${card.cardPrices![0].ebayPrice}",
                      style: AppStyle.cardDescriptionStyle,
                    ),
                    SizedBox(height: 8.0),
                    StyledText(
                      text: "Amazon: \$${card.cardPrices![0].amazonPrice}",
                      style: AppStyle.cardDescriptionStyle,
                    ),
                    SizedBox(height: 8.0),
                    StyledText(
                      text:
                          "CoolStuffInc: \$${card.cardPrices![0].coolstuffincPrice}",
                      style: AppStyle.cardDescriptionStyle,
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
      backgroundColor: AppStyle.primaryColor, // Fondo negro oscuro
    );
  }
}
