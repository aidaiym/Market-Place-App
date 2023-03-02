import 'package:flutter/material.dart';

import 'modules/product/view/product_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Market Place App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProductView(),
    );
  }
}
