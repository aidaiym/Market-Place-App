import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductDeletePage extends StatefulWidget {
  final int productId;

  const ProductDeletePage({required Key key, required this.productId})
      : super(key: key);

  @override
  _ProductDeletePageState createState() => _ProductDeletePageState();
}

class _ProductDeletePageState extends State<ProductDeletePage> {
  Future<void> _deleteProduct(int productId) async {
    final response = await http.delete(
      Uri.parse('http://192.168.176.113:8000/products/$productId/'),
    );

    if (response.statusCode == 204) {
      // Success
      Navigator.of(context).pop(true);
    } else {
      // Error
      throw Exception('Failed to delete product');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Product'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Are you sure you want to delete this product?',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _deleteProduct(widget.productId);
              },
              child: Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }
}
