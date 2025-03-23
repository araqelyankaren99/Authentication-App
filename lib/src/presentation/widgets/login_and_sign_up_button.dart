import 'package:flutter/material.dart';

enum AuthMode { login, signup }

class LoginAndSignUpButton extends StatelessWidget {
  const LoginAndSignUpButton({
    super.key,
    required this.authMode,
    required this.onLoginTap,
    required this.onSignUpTap,
    required this.activeColor,
    required this.inactiveColor,
    required this.textActiveColor,
    required this.textInactiveColor,
    required this.loginText,
    required this.signUpText,
    this.borderRadius = 20,
  });

  final AuthMode authMode;
  final VoidCallback onLoginTap;
  final VoidCallback onSignUpTap;
  final Color activeColor;
  final Color inactiveColor;
  final double borderRadius;
  final Color textActiveColor;
  final Color textInactiveColor;
  final String loginText;
  final String signUpText;

  static const _duration = Duration(milliseconds: 300);
  static const _curve = Curves.easeOut;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: inactiveColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(borderRadius),
                      bottomLeft: Radius.circular(borderRadius),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: inactiveColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(borderRadius),
                      bottomRight: Radius.circular(borderRadius),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: onLoginTap,
                  child: AnimatedContainer(
                    duration: _duration,
                    curve: _curve,
                    decoration: BoxDecoration(
                      color: authMode == AuthMode.login
                          ? activeColor
                          : Colors.transparent,
                      borderRadius: authMode == AuthMode.login
                          ? BorderRadius.circular(borderRadius)
                          : BorderRadius.zero,
                    ),
                    child: Center(
                      child: Text(
                        loginText,
                        style: TextStyle(
                          color: authMode == AuthMode.login
                              ? textActiveColor
                              : textInactiveColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: onSignUpTap,
                  child: AnimatedContainer(
                    duration: _duration,
                    curve: _curve,
                    decoration: BoxDecoration(
                      color: authMode == AuthMode.signup
                          ? activeColor
                          : Colors.transparent,
                      borderRadius: authMode == AuthMode.signup
                          ? BorderRadius.circular(borderRadius)
                          : BorderRadius.zero,
                    ),
                    child: Center(
                      child: Text(
                        signUpText,
                        style: TextStyle(
                          color: authMode == AuthMode.signup
                              ? textActiveColor
                              : textInactiveColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}