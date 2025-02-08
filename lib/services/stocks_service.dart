import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stock_dashboard/services/stocks_model.dart';

class StockService {
  final String apiUrl = 'http://jsonblob.com/api/jsonBlob/1336749022408531968'; 
  // fetchs data from json
  Future<List<Stock>> fetchStocks() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)['stocks'];
      return jsonData.map((json) => Stock.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load stocks');
    }
  }
}