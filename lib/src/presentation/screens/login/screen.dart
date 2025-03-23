import 'package:flutter/material.dart';
import 'package:flutter_authentication_app/src/presentation/widgets/login_and_sign_up_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}



class _LoginScreenState extends State<LoginScreen> {
// Enum to define the segments

  // State to track the selected segment
  AuthMode _selectedSegment = AuthMode.login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login / Sign Up'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: LoginAndSignUpButton(
            authMode: _selectedSegment,
            onLoginTap: _onLoginTap,
            onSignUpTap: _onSignUpTap,
            activeColor: Color(0xFF1A5CFF),
            inactiveColor: Colors.lightBlue,
            textActiveColor: Colors.white,
            textInactiveColor: Colors.black,
            loginText: 'Login',
            signUpText : 'Sign Up',
          ),
        ),
      ),
    );
  }

  void _onLoginTap() {
    setState(() {
      _selectedSegment = AuthMode.login;
    });
  }

  void _onSignUpTap() {
    setState(() {
      _selectedSegment = AuthMode.signup;
    });
  }
}

