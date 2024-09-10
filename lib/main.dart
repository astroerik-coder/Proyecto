import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/card_provider.dart';
import 'components/organisms/card_list.dart';
import 'components/atoms/app_style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          colorScheme: const ColorScheme.dark(
            primary: AppStyle.primaryColor,
            secondary: AppStyle.accentColor,
          ),
          textTheme: TextTheme(
            displayLarge: AppStyle.headingStyle,
            titleLarge: AppStyle.subheadingStyle,
            bodyLarge: AppStyle.cardDescriptionStyle,
            bodyMedium: AppStyle.cardTitleStyle,
          ),
          appBarTheme: const AppBarTheme(
            color: AppStyle.primaryColor,
          ),
        ),
        home: const CardList(),
      ),
    );
  }
}
