import 'package:flutter/material.dart';
import '../../../export_files.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget(this.products, {super.key});
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        final product = products[index];
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.main,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${product.id}'),
                Text(product.name),
                Text(product.description),
              ],
            ),
          ),
        );
      },
    );
  }
}
