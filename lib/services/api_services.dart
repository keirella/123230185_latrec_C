import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {

  static Future<List<dynamic>>
      getProducts() async {

    final response = await http.get(
      Uri.parse(
        "https://dummyjson.com/products",
      ),
    );

    final data = jsonDecode(response.body);

    return data['products'];
  }
}