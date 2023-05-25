import 'package:flutter/material.dart';
import '../../../export_files.dart';

class ProductListWidget extends StatefulWidget {
  const ProductListWidget(this.products, {super.key});
  final List<ProductModel> products;

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.products.length,
      itemBuilder: (context, index) {
        ProductModel product = widget.products[index];
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          child: ListTile(
            tileColor: AppColors.main,
            textColor: Colors.white,
            contentPadding: const EdgeInsets.all(10),
            leading: Text('${product.id}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name),
                Text(product.description),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    ProductService.deleteProduct(index);
                    setState(() {
                      widget.products.removeAt(index);
                    });
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}





/*
GridView.builder(
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
*/ 