import 'package:flutter/material.dart';

class AppStyle {
  // Colores principales de la app
  static const Color primaryColor = Color(0xFF1A237E); // Azul oscuro
  static const Color secondaryColor = Color(0xFFB71C1C); // Rojo oscuro
  static const Color accentColor = Color(0xFFFFD700); // Dorado
  static const Color backgroundColor = Color(0xFFE8EAF6); // Fondo claro
  static const Color cardBackgroundColor = Color(0xFFF5F5F5); // Fondo de cartas

  // Estilos de texto
  static const TextStyle headingStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: primaryColor,
  );

  static const TextStyle subheadingStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black87,
  );

  static const TextStyle cardTitleStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle cardDescriptionStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.black54,
  );

  // Otros estilos
  static BoxDecoration cardDecoration = BoxDecoration(
    color: cardBackgroundColor,
    borderRadius: BorderRadius.circular(8.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 4.0,
        offset: Offset(0, 2),
      ),
    ],
  );
}
