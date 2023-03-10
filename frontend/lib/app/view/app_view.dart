import 'package:flutter/material.dart';

import '../app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Market Place App',
      onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
    );
  }
}
