import 'package:flutter/material.dart';
import 'package:flutter_authentication_app/src/utils/resources/colors.dart';

class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  const AppThemeExtension({
    required this.backgroundColor,
    required this.waveColor,
    required this.loginAndSignUpButtonActiveColor,
    required this.loginAndSignUpButtonInactiveColor,
    required this.loginAndSignUpButtonActiveTextColor,
    required this.loginAndSignUpButtonInactiveTextColor,
    required this.borderColor,
    required this.hintTextColor,
    required this.forgetButtonColor,
    required this.errorColor,
  });

  final Color backgroundColor;
  final Color waveColor;
  final Color loginAndSignUpButtonActiveColor;
  final Color loginAndSignUpButtonInactiveColor;
  final Color loginAndSignUpButtonActiveTextColor;
  final Color loginAndSignUpButtonInactiveTextColor;
  final Color borderColor;
  final Color hintTextColor;
  final Color forgetButtonColor;
  final Color errorColor;

  @override
  AppThemeExtension copyWith({
    Color? backgroundColor,
    Color? waveColor,
    Color? loginAndSignUpButtonActiveColor,
    Color? loginAndSignUpButtonInactiveColor,
    Color? loginAndSignUpButtonActiveTextColor,
    Color? loginAndSignUpButtonInactiveTextColor,
    Color? borderColor,
    Color? hintTextColor,
    Color? forgetButtonColor,
    Color? errorColor,
  }) {
    return AppThemeExtension(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      waveColor: waveColor ?? this.waveColor,
      loginAndSignUpButtonActiveColor:
          loginAndSignUpButtonActiveColor ??
          this.loginAndSignUpButtonActiveColor,
      loginAndSignUpButtonInactiveColor:
          loginAndSignUpButtonInactiveColor ??
          this.loginAndSignUpButtonInactiveColor,
      loginAndSignUpButtonActiveTextColor:
          loginAndSignUpButtonActiveTextColor ??
          this.loginAndSignUpButtonActiveTextColor,
      loginAndSignUpButtonInactiveTextColor:
          loginAndSignUpButtonInactiveTextColor ??
          this.loginAndSignUpButtonInactiveTextColor,
      borderColor: borderColor ?? this.borderColor,
      hintTextColor: hintTextColor ?? this.hintTextColor,
      forgetButtonColor: forgetButtonColor ?? this.forgetButtonColor,
      errorColor: errorColor ?? this.errorColor,
    );
  }

  @override
  AppThemeExtension lerp(ThemeExtension<AppThemeExtension>? other, double t) {
    if (other is! AppThemeExtension) {
      return this;
    }

    return AppThemeExtension(
      backgroundColor:
          Color.lerp(backgroundColor, other.backgroundColor, t) ??
          backgroundColor,
      waveColor: Color.lerp(waveColor, other.waveColor, t) ?? waveColor,
      loginAndSignUpButtonActiveColor:
          Color.lerp(
            loginAndSignUpButtonActiveColor,
            other.loginAndSignUpButtonActiveColor,
            t,
          ) ??
          loginAndSignUpButtonActiveColor,
      loginAndSignUpButtonInactiveColor:
          Color.lerp(
            loginAndSignUpButtonInactiveColor,
            other.loginAndSignUpButtonInactiveColor,
            t,
          ) ??
          loginAndSignUpButtonInactiveColor,
      loginAndSignUpButtonActiveTextColor:
          Color.lerp(
            loginAndSignUpButtonActiveTextColor,
            other.loginAndSignUpButtonActiveTextColor,
            t,
          ) ??
          loginAndSignUpButtonActiveTextColor,
      loginAndSignUpButtonInactiveTextColor:
          Color.lerp(
            loginAndSignUpButtonInactiveTextColor,
            other.loginAndSignUpButtonInactiveTextColor,
            t,
          ) ??
          loginAndSignUpButtonInactiveTextColor,
      borderColor: Color.lerp(borderColor, other.borderColor, t) ?? borderColor,
      hintTextColor:
          Color.lerp(hintTextColor, other.hintTextColor, t) ?? hintTextColor,
      forgetButtonColor:
          Color.lerp(forgetButtonColor, other.forgetButtonColor, t) ??
          forgetButtonColor,
      errorColor: Color.lerp(errorColor, other.errorColor, t) ?? errorColor,
    );
  }

  static AppThemeExtension lightTheme = AppThemeExtension(
    backgroundColor: AppColors.backgroundLightColor,
    waveColor: AppColors.waveLightColor,
    loginAndSignUpButtonActiveColor:
        AppColors.loginAndSignUpButtonActiveLightColor,
    loginAndSignUpButtonInactiveColor:
        AppColors.loginAndSignUpButtonInactiveLightColor,
    loginAndSignUpButtonActiveTextColor:
        AppColors.loginAndSignUpButtonActiveTextLightColor,
    loginAndSignUpButtonInactiveTextColor:
        AppColors.loginAndSignUpButtonInactiveTextLightColor,
    borderColor: AppColors.borderLightColor,
    hintTextColor: AppColors.hintTextLightColor,
    forgetButtonColor: AppColors.forgetButtonLightColor,
    errorColor: AppColors.errorLightColor,
  );

  static AppThemeExtension darkTheme = const AppThemeExtension(
    backgroundColor: AppColors.backgroundDarkColor,
    waveColor: AppColors.waveDarkColor,
    loginAndSignUpButtonActiveColor:
        AppColors.loginAndSignUpButtonActiveDarkColor,
    loginAndSignUpButtonInactiveColor:
        AppColors.loginAndSignUpButtonInactiveDarkColor,
    loginAndSignUpButtonActiveTextColor:
        AppColors.loginAndSignUpButtonActiveTextDarkColor,
    loginAndSignUpButtonInactiveTextColor:
        AppColors.loginAndSignUpButtonInactiveTextDarkColor,
    borderColor: AppColors.borderDarkColor,
    hintTextColor: AppColors.hintTextDarkColor,
    forgetButtonColor: AppColors.forgetButtonDarkColor,
    errorColor: AppColors.errorDarkColor,
  );
}
