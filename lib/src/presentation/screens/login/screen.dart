import 'package:flutter/material.dart';
import 'package:flutter_authentication_app/src/presentation/widgets/custom_input.dart';
import 'package:flutter_authentication_app/src/utils/resources/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}



class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login / Sign Up'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: CustomInputWidget(
            onChanged: _onChanged,
            textColor: AppColors.hintTextLightColor,
            borderColor: AppColors.borderLightColor,
            errorBorderColor: AppColors.errorLightColor,
            hintText: 'Username',
            hasError: true,
          ),
        ),
      ),
    );
  }

  void _onChanged(String text){

  }
}

