import 'package:flutter/material.dart';

import 'create_product.dart';

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
      home: CreateProductPage(),
    );
  }
}
