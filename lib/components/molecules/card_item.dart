import 'package:flutter/material.dart';
import '../../models/card_model.dart'; // Asegúrate de importar el modelo correcto
import '../atoms/card_image.dart';
import '../atoms/styled_text.dart';
import '../atoms/app_style.dart';
import '../../views/card_detail.dart';

class CardItem extends StatelessWidget {
  final Datum card; // Cambia de CardModel a Datum

  const CardItem({Key? key, required this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navega a la pantalla de detalle de la carta
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                CardDetail(card: card), // Asegúrate de pasar el objeto Datum
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
              child: (card.cardImages != null && card.cardImages!.isNotEmpty)
                  ? Image.network(
                      card.cardImages![0]
                          .imageUrl, // Accedemos a la primera imagen solo si está disponible
                      height: 100.0,
                      width: 70.0,
                      fit: BoxFit.cover, // Ajustar la imagen
                    )
                  : Container(
                      // Mostramos un contenedor vacío si no hay imágenes
                      height: 100.0,
                      width: 70.0,
                      color: Colors
                          .grey, // Podrías usar un color de fondo o un placeholder aquí
                    ),
            ),

            SizedBox(width: 16.0),
            // Información de la carta
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyledText(
                    text: card.name,
                    style: AppStyle.cardTitleStyle,
                  ),
                  SizedBox(height: 8.0),
                  StyledText(
                    text: card.desc ??
                        'No description available', // Proporcionamos un valor predeterminado si `desc` es null
                    style: AppStyle.cardDescriptionStyle,
                    maxLines: 3, // Limitamos el número de líneas
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
