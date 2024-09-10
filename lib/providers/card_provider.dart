import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/card_model.dart';

class CardProvider with ChangeNotifier {
  final List<Datum> _cards = [];
  bool _loading = false;
  int _offset = 0;
  final int _limit = 10;
  String _errorMessage = '';
  bool _hasMore = true; // Controla si hay más cartas para cargar

  List<Datum> get cards => _cards;
  bool get loading => _loading;
  String get errorMessage => _errorMessage;
  bool get hasMore => _hasMore;

  Future<void> loadMoreCards() async {
    if (_loading || !_hasMore) {
      return; // Evitar duplicar llamadas o seguir si no hay más cartas
    }
    _loading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      List<Datum> newCards =
          await ApiService.fetchCards(limit: _limit, offset: _offset);

      // Verificar si se recibieron nuevas cartas
      if (newCards.isNotEmpty) {
        _cards.addAll(newCards);
        _offset += _limit;
      } else {
        // Si no se reciben más cartas, indicamos que no hay más
        _hasMore = false;
      }
    } catch (e) {
      _errorMessage = 'Error al cargar las cartas: $e';
    }

    _loading = false;
    notifyListeners();
  }
}
