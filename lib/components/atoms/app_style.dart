import 'package:flutter/material.dart';

class AppStyle {
  // Colores principales para un tema oscuro y futurista inspirado en Yu-Gi-Oh
  static const Color primaryColor =
      Color(0xFF1B1B2F); // Negro con tonos azulados/morados
  static const Color secondaryColor = Color(0xFF30336B); // Morado oscuro
  static const Color accentColor =
      Color(0xFF8E44AD); // Morado brillante para detalles
  static const Color cardBackgroundColor =
      Color(0xFF2C2C54); // Morado oscuro para el fondo de las cartas
  static const Color textColor = Color(0xFFF1F1F1); // Blanco suave para textos

  // Estilos de texto
  static const TextStyle headingStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: textColor,
  );

  static const TextStyle subheadingStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: textColor,
  );

  static const TextStyle cardTitleStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: textColor,
  );

  static TextStyle cardDescriptionStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: textColor.withOpacity(0.85), // Ajustamos la opacidad sin const
  );

  // Estilo futurista para las cartas (sombras moradas)
  static BoxDecoration cardDecoration = BoxDecoration(
    color: cardBackgroundColor,
    borderRadius: BorderRadius.circular(12.0),
    boxShadow: [
      BoxShadow(
        color: accentColor.withOpacity(0.6), // Sombra morada brillante
        blurRadius: 10.0,
        offset: Offset(0, 4),
      ),
    ],
    border: Border.all(
      color: accentColor.withOpacity(0.8), // Borde morado brillante
      width: 1.5,
    ),
  );
}
