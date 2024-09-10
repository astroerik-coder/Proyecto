import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/card_model.dart';

class ApiService {
  final String _baseUrl = 'https://db.ygoprodeck.com/api/v7/cardinfo.php';

  Future<List<CardModel>> fetchCards({int limit = 10, int offset = 0}) async {
    try {
      final response =
          await http.get(Uri.parse('$_baseUrl?num=$limit&offset=$offset'));
      print('Respuesta de la API: ${response.body}');

      if (response.statusCode == 200) {
        List data = json.decode(response.body)['data'];
        return data.map((json) => CardModel.fromJson(json)).toList();
      } else {
        throw Exception('Error al cargar las cartas');
      }
    } catch (e) {
      print('Error en la llamada a la API: $e');
      throw Exception('Error al conectar con la API: $e');
    }
  }
}
