import 'dart:convert';

import 'package:fake_store_api/providers/product_model.dart';
import 'package:http/http.dart' as http;

class FetchData {
  Future<List<ProductModel>> getAll() async {
    const url = 'https://fakestoreapi.com/products';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final products = json.map((e) => ProductModel.fromJson(e)).toList();
      return products;
    }
    return [];
  }
}
