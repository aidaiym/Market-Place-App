import 'package:flutter/material.dart';
import 'package:frontend/services/get_request.dart';
import 'models/product_model.dart';

class DisplayProductsPage extends StatefulWidget {
  const DisplayProductsPage({super.key});
  @override
  _DisplayProductsPageState createState() => _DisplayProductsPageState();
}

class _DisplayProductsPageState extends State<DisplayProductsPage> {
  late List<ProductModel>? _productModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _productModel = (await GetRequestService().getProductList())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Example'),
      ),
      body: _productModel == null || _productModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _productModel!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_productModel![index].name),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_productModel![index].description),
                          Text(_productModel![index].price),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
