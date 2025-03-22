import 'package:flutter/material.dart';
import 'package:flutter_authentication_app/src/config/navigation/route_names.dart';
import 'package:flutter_authentication_app/src/presentation/screens/home/screen.dart';
import 'package:flutter_authentication_app/src/presentation/screens/login/screen.dart';

class MainNavigation {
  const MainNavigation({
    required this.initialRoute,
  });

  final String initialRoute;

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.login:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => _makeLoginScreen(),
        );

      case MainNavigationRouteNames.home:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => _makeHomeScreen(),
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => _makeErrorScreen(),
        );
    }
  }
}

Widget _makeLoginScreen() {
  return const LoginScreen();
}

Widget _makeHomeScreen() {
  return const HomeScreen();
}

Widget _makeErrorScreen() {
  return const Scaffold(
    body: Center(
      child: Text('Navigation error!!!'),
    ),
  );
}