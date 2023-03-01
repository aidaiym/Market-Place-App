import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'constants/api/api_constants.dart';

class EditProductPage extends StatefulWidget {
  final int productId;

  EditProductPage({required Key key, required this.productId})
      : super(key: key);

  @override
  _EditProductPageState createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _imageController = TextEditingController();

  Future<void> _editProduct(
      int productId, Map<String, dynamic> productData) async {
    final response = await http.put(
      Uri.parse(
          '${ApiConstants.baseUrl}/${ApiConstants.productUrl}/$productId/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(productData),
    );

    if (response.statusCode == 200) {
      // Success
      Navigator.of(context).pop(true);
    } else {
      // Error
      throw Exception('Failed to edit product');
    }
  }

  @override
  void initState() {
    super.initState();
    _getProduct(widget.productId);
  }

  void _getProduct(int productId) async {
    final response = await http.get(Uri.parse(
        '${ApiConstants.baseUrl}/${ApiConstants.productUrl}/$productId/'));

    if (response.statusCode == 200) {
      final product = jsonDecode(response.body);
      _nameController.text = product['name'];
      _descriptionController.text = product['description'];
      _priceController.text = product['price'].toString();
      _imageController.text = product['image'];
    } else {
      throw Exception('Failed to load product');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Product name',
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  hintText: 'Product description',
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Product price',
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _imageController,
                decoration: InputDecoration(
                  hintText: 'Product image URL',
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final productData = {
                      'name': _nameController.text,
                      'description': _descriptionController.text,
                      'price': double.parse(_priceController.text),
                      'image': _imageController.text,
                    };
                    _editProduct(widget.productId, productData);
                  }
                },
                child: Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
