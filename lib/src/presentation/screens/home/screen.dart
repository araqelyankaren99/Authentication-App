import 'package:flutter/material.dart';
import 'package:flutter_authentication_app/src/config/theme/theme.dart';
import 'package:flutter_authentication_app/src/domain/entity/user.dart';
import 'package:flutter_authentication_app/src/utils/resources/texts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.user});

  final User user;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppThemeExtension>();

    return Scaffold(
      backgroundColor: theme?.backgroundColor,
      body: SafeArea(
        child: Text(
          '${AppTexts.hello} \n ${widget.user.username}',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
