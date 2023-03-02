import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../constants/api/api_constants.dart';
import '../../../models/product/product_model.dart';

class ProductService {
  static String productUrl = ApiConstants.baseUrl + ApiConstants.product;

  static Future<List<ProductModel>> getAllProducts() async {
    final response = await http.get(Uri.parse(productUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  static Future<ProductModel> getProductById(int id) async {
    final response = await http.get(Uri.parse('$productUrl/$id'));
    if (response.statusCode == 200) {
      final dynamic jsonResponse = json.decode(response.body);
      return ProductModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load product');
    }
  }

  static Future<ProductModel> createProduct(ProductModel product) async {
    final response = await http.post(
      Uri.parse(productUrl),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(product.toJson()),
    );
    if (response.statusCode == 201) {
      final dynamic jsonResponse = json.decode(response.body);
      return ProductModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to create product');
    }
  }

  static Future<void> deleteProduct(int id) async {
    final url = Uri.parse('$productUrl/$id');
    final http.Response response = await http.delete(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 204) {
      return;
    } else {
      throw Exception('Failed to delete album.');
    }
  }

  // Future<http.Response> updateProduct(
  //     int id, String name, String description, String price) {
  //   final url = Uri.parse('$productUrl/$id');
  //   return http.put(
  //     url,
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'name': name,
  //       'description': description,
  //       'price': price,
  //     }),
  //   );
  // }
}
