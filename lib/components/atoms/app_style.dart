import 'package:flutter/material.dart';

class AppStyle {
  static const Color primaryColor = Color(0xFF1B1B2F);
  static const Color secondaryColor = Color(0xFF30336B);
  static const Color accentColor = Color(0xFF8E44AD);
  static const Color cardBackgroundColor = Color(0xFF2C2C54);
  static const Color textColor = Color(0xFFF1F1F1);

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
    color: textColor.withOpacity(0.85),
  );

  static BoxDecoration cardDecoration = BoxDecoration(
    color: cardBackgroundColor,
    borderRadius: BorderRadius.circular(12.0),
    boxShadow: [
      BoxShadow(
        color: accentColor.withOpacity(0.6),
        blurRadius: 10.0,
        offset: const Offset(0, 4),
      ),
    ],
    border: Border.all(
      color: accentColor.withOpacity(0.8),
      width: 1.5,
    ),
  );
}
