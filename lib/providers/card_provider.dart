import 'package:flutter/material.dart';
import '../models/card_model.dart';
import '../services/api_service.dart';

class CardProvider with ChangeNotifier {
  List<CardModel> _cards = [];
  bool _loading = false;
  int _offset = 0;
  final int _limit = 10;

  List<CardModel> get cards => _cards;
  bool get loading => _loading;

  Future<void> loadMoreCards() async {
    print('Cargando cartas...');
    _loading = true;
    notifyListeners();

    try {
      List<CardModel> newCards =
          await ApiService().fetchCards(limit: _limit, offset: _offset);
      print('Cartas cargadas: ${newCards.length}');
      _cards.addAll(newCards);
      _offset += _limit;
    } catch (e) {
      print('Error al cargar las cartas: $e');
    }

    _loading = false;
    notifyListeners();
  }
}
