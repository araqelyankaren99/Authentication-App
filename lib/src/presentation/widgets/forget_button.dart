import 'package:flutter/material.dart';
import 'package:flutter_authentication_app/src/config/theme/theme.dart';
import 'package:flutter_authentication_app/src/utils/resources/texts.dart';

class ForgetButtonWidget extends StatelessWidget {
  const ForgetButtonWidget({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppThemeExtension>();
    final color = theme?.forgetButtonColor;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        child: Text(
          AppTexts.forgotPasswordButtonText,
          style: TextStyle(
            color: color,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
