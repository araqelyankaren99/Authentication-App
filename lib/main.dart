import 'package:flutter/material.dart';
import 'package:flutter_authentication_app/src/config/navigation/main_navigation.dart';
import 'package:flutter_authentication_app/src/config/navigation/route_names.dart';
import 'package:flutter_authentication_app/src/domain/entity/user.g.dart';

Future<void> main() async{
  const initialRoute = MainNavigationRouteNames.login;

  WidgetsFlutterBinding.ensureInitialized();
  await initStore();

  final mainNavigation = MainNavigation(initialRoute: initialRoute);
  runApp(MyApp(mainNavigation: mainNavigation));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.mainNavigation});

  final MainNavigation mainNavigation;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: mainNavigation.initialRoute,
      onGenerateRoute: mainNavigation.onGenerateRoute,
    );
  }
}