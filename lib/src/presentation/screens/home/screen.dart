import 'package:flutter/material.dart';
import 'package:flutter_authentication_app/src/domain/entity/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key,required this.user});

  final User user;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Text('Hello \n ${widget.user.username}',style: TextStyle(fontSize: 20),)));
  }
}
