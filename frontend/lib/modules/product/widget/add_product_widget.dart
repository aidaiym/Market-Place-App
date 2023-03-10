import 'package:flutter/material.dart';
import '../../../export_files.dart';

class AddProductWidget extends StatefulWidget {
  const AddProductWidget(this.products, {super.key});
  final List<ProductModel> products;

  @override
  State<AddProductWidget> createState() => _AddProductWidgetState();
}

class _AddProductWidgetState extends State<AddProductWidget> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _decriptionController = TextEditingController();

  Future<void> _addProduct() async {
    final name = _nameController.text;
    final description = _decriptionController.text;
    final price = _priceController.text;
    if (name.isNotEmpty && price.isNotEmpty && description.isNotEmpty) {
      ProductService.createProduct(
          ProductModel(name: name, price: price, description: description));
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text('Ийгиликтуу кошулду!'),
            actions: [
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );

      _nameController.clear();
      _decriptionController.clear();
      _priceController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(38.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Жаны продукт кошуу!'),
          TextFieldWidget(
            controller: _nameController,
            labelText: 'Продукты',
            hintText: 'Продуктын аталышын жазыныз',
          ),
          TextFieldWidget(
            controller: _decriptionController,
            labelText: 'Продуктын суроттолушу',
            hintText: 'Продуктынын суроттолушун жазыныз',
          ),
          TextFieldWidget(
            controller: _priceController,
            labelText: 'Баасы',
            hintText: 'Продуктынын баасын жазыныз',
          ),
          ElevatedButton(onPressed: _addProduct, child: const Text('Save'))
        ],
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required TextEditingController controller,
    required this.labelText,
    required this.hintText,
  }) : _controller = controller;

  final TextEditingController _controller;
  final String labelText;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          labelText: labelText,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(width: 2, color: AppColors.main),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(width: 2, color: AppColors.main),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
