import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;

  const CardImage({
    Key? key,
    required this.imageUrl,
    this.height = 100.0,
    this.width = 70.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      height: height,
      width: width,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
            child:
                CircularProgressIndicator()); // Indicador mientras carga la imagen
      },
      errorBuilder: (context, error, stackTrace) {
        return Icon(Icons.broken_image,
            size: height); // Icono en caso de error al cargar la imagen
      },
    );
  }
}
