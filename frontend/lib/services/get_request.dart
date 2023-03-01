import 'dart:developer';

import 'package:frontend/models/product_model.dart';
import 'package:http/http.dart' as http;

import '../constants/api/api_constants.dart';

class GetRequestService {
  Future<List<ProductModel>?> getProductList() async {
    try {
      final url = Uri.parse(ApiConstants.baseUrl + ApiConstants.productUrl);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<ProductModel> _model = productFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
