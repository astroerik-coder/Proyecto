import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/card_provider.dart';
import 'views/card_list.dart';
import 'components/atoms/app_style.dart'; // Importamos los estilos

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CardProvider()..loadMoreCards(),
      child: MaterialApp(
        title: 'Yu-Gi-Oh! Cartas',
        theme: ThemeData(
          brightness: Brightness.dark, // Tema oscuro
          primaryColor:
              AppStyle.primaryColor, // Negro oscuro para la barra de app
          scaffoldBackgroundColor:
              AppStyle.primaryColor, // Fondo oscuro para la app
          colorScheme: ColorScheme.dark(
            primary: AppStyle.primaryColor,
            secondary: AppStyle.accentColor,
          ),
          textTheme: TextTheme(
            displayLarge: AppStyle.headingStyle, // Antes 'headline1'
            titleLarge: AppStyle.subheadingStyle, // Antes 'headline6'
            bodyLarge: AppStyle.cardDescriptionStyle, // Antes 'bodyText1'
            bodyMedium: AppStyle.cardTitleStyle, // Antes 'bodyText2'
          ),
          appBarTheme: AppBarTheme(
            color: AppStyle.primaryColor, // Color de fondo de la AppBar
            elevation: 0,
          ),
        ),
        home: CardList(),
      ),
    );
  }
}
