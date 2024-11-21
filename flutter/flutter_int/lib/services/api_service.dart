import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {
  static Future<Map<String, dynamic>> fetchCoinPrice() async {
    final url = 'https://api.coindesk.com/v1/bpi/currentprice.json';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
