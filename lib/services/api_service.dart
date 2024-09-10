import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/card_model.dart';

class ApiService {
  static Future<List<Datum>> fetchCards(
      {required int limit, required int offset}) async {
    final url =
        'https://db.ygoprodeck.com/api/v7/cardinfo.php?num=$limit&offset=$offset';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Verificar que 'data' no sea null y que contenga una lista
        if (data != null && data['data'] != null && data['data'] is List) {
          List<dynamic> cardData = data['data'];

          // Convertir los datos a una lista de objetos Datum
          return cardData.map((item) => Datum.fromJson(item)).toList();
        } else {
          // Si no hay datos válidos, retornar una lista vacía
          return [];
        }
      } else {
        throw Exception(
            'Error al conectar con la API: Código ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al conectar con la API: $e');
    }
  }
}
