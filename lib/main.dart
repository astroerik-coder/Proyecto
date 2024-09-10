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
          brightness: Brightness.dark,
          primaryColor: AppStyle.primaryColor,
          scaffoldBackgroundColor: AppStyle.primaryColor,
          colorScheme: ColorScheme.dark(
            primary: AppStyle.primaryColor,
            secondary: AppStyle.accentColor,
          ),
          textTheme: TextTheme(
            displayLarge: AppStyle.headingStyle,
            titleLarge: AppStyle.subheadingStyle,
            bodyLarge: AppStyle.cardDescriptionStyle,
            bodyMedium: AppStyle.cardTitleStyle,
          ),
          appBarTheme: AppBarTheme(
            color: AppStyle.primaryColor,
          ),
        ),
        home: CardList(),
      ),
    );
  }
}
