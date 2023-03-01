import 'dart:convert';

import 'package:http/http.dart' as http;
import '../constants/api/api_constants.dart';
import '../models/product_model.dart';

class CreateRequestService {
  Future<http.Response> createProduct(ProductModel newProduct) async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.productUrl);
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(newProduct.toJson()),
    );

    if (response.statusCode == 201) {
      return response;
    } else {
      throw Exception('Failed to create product.');
    }
  }
}
