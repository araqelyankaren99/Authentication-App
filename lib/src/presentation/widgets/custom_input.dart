import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef OnChanged = void Function(String);

class CustomInputWidget extends StatelessWidget {
  const CustomInputWidget({
    super.key,
    required this.onChanged,
    this.inputFormatters = const [],
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.hasError = false,
    this.isPassword = false,
    required this.textColor,
    required this.borderColor,
    required this.errorBorderColor,
    this.showCursor = true,
    this.radius = 16,
    this.hintText,
  });

  final OnChanged onChanged;
  final List<TextInputFormatter> inputFormatters;
  final TextInputType textInputType;
  final String? hintText;
  final bool hasError;
  final bool isPassword;
  final TextInputAction textInputAction;
  final double radius;
  final Color textColor;
  final Color borderColor;
  final Color errorBorderColor;
  final bool showCursor;

  @override
  Widget build(BuildContext context) {
    final effectiveBorderColor = hasError ? errorBorderColor : borderColor;
    return TextField(
      autocorrect: false,
      showCursor: hasError ? false : showCursor,
      cursorColor: textColor,
      textInputAction: textInputAction,
      obscureText: isPassword,
      keyboardType: textInputType,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: textColor,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          borderSide: BorderSide(
            width: 1,
            color: effectiveBorderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          borderSide: BorderSide(
            width: 1,
            color: effectiveBorderColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          borderSide: BorderSide(
            width: 1,
            color: effectiveBorderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          borderSide: BorderSide(
            width: 1,
            color: effectiveBorderColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          borderSide: BorderSide(
            width: 1,
            color: effectiveBorderColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          borderSide: BorderSide(
            width: 2,
            color: effectiveBorderColor,
          ),
        ),
        errorText: hasError ? '' : null,
        errorStyle: const TextStyle(fontSize: 0, height: -8),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: textColor,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
      ),
    );
  }
}