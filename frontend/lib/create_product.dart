import 'package:flutter/material.dart';
import 'package:frontend/services/create_request.dart';

import 'display_product.dart';
import 'models/product_model.dart';

class CreateProductPage extends StatefulWidget {
  const CreateProductPage({super.key});

  @override
  _CreateProductPageState createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  Future<ProductModel>? _futureProduct;
  CreateRequestService requestService = CreateRequestService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Product'),
      ),
      body: (_futureProduct == null) ? buildColumn() : buildFutureBuilder(),
    );
  }

  Padding buildColumn() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: 'Product name',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a product name';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                hintText: 'Product description',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a product description';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Product price',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a product price';
                }
                if (double.tryParse(value) == null) {
                  return 'Please enter a valid product price';
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_formKey.currentState!.validate()) {
                    ProductModel productData = ProductModel(
                        name: _nameController.text,
                        description: _descriptionController.text,
                        price: _priceController.text);
                    requestService.createProduct(productData);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DisplayProductsPage()),
                    );
                  }
                });
              },
              child: const Text('Create Product'),
            )
          ],
        ),
      ),
    );
  }

  FutureBuilder<ProductModel> buildFutureBuilder() {
    return FutureBuilder<ProductModel>(
      future: _futureProduct,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.name);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}


/*

 _productModel == null || _productModel!.isEmpty? Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: 'Product name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a product name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  hintText: 'Product description',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a product description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Product price',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a product price';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid product price';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
        setState(() {
          _futureAlbum = createAlbum(_controller.text);
        });
      },
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final productData = {
                      'name': _nameController.text,
                      'description': _descriptionController.text,
                      'price': double.parse(_priceController.text),
                    };
                    _createProduct(productData);
                  }
                },
                child: const Text('Create Product'),
              ),
            ],
          ),
        ),
      ),
*/ 