import 'package:flutter/material.dart';
import 'package:frontend/modules/product/service/product_service.dart';

import '../../../models/product/product_model.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  List<ProductModel> _products = [];

  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _decriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _deleteProduct(int productId) async {
    await ProductService.deleteProduct(productId);
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    final products = await ProductService.getAllProducts();
    setState(() {
      _products = products;
    });
  }

  Future<void> _addProduct() async {
    final name = _nameController.text;
    final description = _decriptionController.text;
    final price = _priceController.text;
    if (name.isNotEmpty && price.isNotEmpty && description.isNotEmpty) {
      final product = await ProductService.createProduct(
        ProductModel(name: name, price: price, description: description),
      );
      setState(() {
        _products.add(product);
      });
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product List'),
        ),
        body: FutureBuilder<List<ProductModel>>(
          future: ProductService.getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<ProductModel> products = snapshot.data!;
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final ProductModel product = products[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text('\$${product.price}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        _deleteProduct(product.id!);
                      },
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        title: const Text('Add Product'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: _nameController,
                              decoration: const InputDecoration(
                                labelText: 'Name',
                              ),
                            ),
                            TextField(
                              controller: _decriptionController,
                              decoration: const InputDecoration(
                                labelText: 'Description',
                              ),
                            ),
                            TextField(
                              controller: _priceController,
                              decoration: const InputDecoration(
                                labelText: 'Price',
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          ElevatedButton(
                              onPressed: _addProduct, child: const Text('Save'))
                        ]);
                  });
            }));
  }
}