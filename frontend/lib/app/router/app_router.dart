import 'package:flutter/cupertino.dart';
import 'package:frontend/modules/main/main.dart';
import '../../modules/modules.dart';

class AppRouter {
  const AppRouter();

  static const String main = '/';
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
  static const String addProduct = '/addProduct';
  static const String profile = '/profile';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case main:
        return CupertinoPageRoute(
          builder: (_) => const MainView(),
          settings: settings,
        );
      case signIn:
        return CupertinoPageRoute(
          builder: (_) => const SignInView(),
          settings: settings,
        );
      case signUp:
        return CupertinoPageRoute(
          builder: (_) => const SignUpView(),
          settings: settings,
        );
      case addProduct:
        return CupertinoPageRoute(
          builder: (_) => const AddProductView(),
          settings: settings,
        );
      case profile:
        return CupertinoPageRoute(
          builder: (_) => const ProfileView(),
          settings: settings,
        );

      default:
        throw Exception(
            'no builder specified for route named: [${settings.name}]');
    }
  }
}
