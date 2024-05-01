import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sneakers_app/pages/StorePAge/models/Market.dart';

Future<List<Product>> fetchData() async {
  final url = Uri.parse('http://localhost:9001/cours/getall');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    List<dynamic> jsonData = json.decode(response.body);
    List<Product> items = [];
    for (var item in jsonData) {
      items.add(Product.fromJson(item));
    }
    return items;
  } else {
    throw Exception('Failed to load data');
  }
}
