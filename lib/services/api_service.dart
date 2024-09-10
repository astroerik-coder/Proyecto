import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/card_model.dart';

class ApiService {
  final String _baseUrl = 'https://db.ygoprodeck.com/api/v7/cardinfo.php';

  Future<List<Datum>> fetchCards({int limit = 10, int offset = 0}) async {
    try {
      final response =
          await http.get(Uri.parse('$_baseUrl?num=$limit&offset=$offset'));

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        Card cardData = Card.fromJson(jsonResponse);
        return cardData.data;
      } else {
        throw Exception('Error al cargar las cartas');
      }
    } catch (e) {
      print('Error en la llamada a la API: $e');
      throw Exception('Error al conectar con la API');
    }
  }
}
