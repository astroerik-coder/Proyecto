import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/card_provider.dart';
import 'views/card_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CardProvider()
        ..loadMoreCards(), // Asegúrate de que el método `loadMoreCards` se llame aquí
      child: MaterialApp(
        title: 'Yu-Gi-Oh! Cartas',
        theme: ThemeData(
          primaryColor: Colors.blue, // Aquí usa un color simple para la prueba
          scaffoldBackgroundColor:
              Colors.grey[200], // Fondo básico para asegurar visualización
        ),
        home: CardList(), // La pantalla principal
      ),
    );
  }
}
