import 'package:flutter/material.dart';
import 'package:flutter_authentication_app/service_locator.dart';
import 'package:flutter_authentication_app/src/config/navigation/main_navigation.dart';
import 'package:flutter_authentication_app/src/config/theme/theme.dart';
import 'package:get_it/get_it.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: GetIt.I<MainNavigation>().initialRoute,
      onGenerateRoute: GetIt.I<MainNavigation>().onGenerateRoute,
      theme: ThemeData.light().copyWith(
        extensions: [AppThemeExtension.lightTheme],
      ),
      darkTheme: ThemeData.dark().copyWith(
        extensions: [AppThemeExtension.darkTheme],
      ),
    );
  }
}