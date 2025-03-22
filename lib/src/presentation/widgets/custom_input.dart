import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef OnChanged = void Function(String);

class CustomInputWidget extends StatelessWidget {
  const CustomInputWidget({
    super.key,
    required this.onChanged,
    this.enabled = true,
    this.inputFormatters = const [],
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.autofocus = false,
    this.hasError = false,
    this.isPassword = false,
    this.textAlign = TextAlign.start,
    required this.textColor,
    this.textFontWeight = FontWeight.w500,
    required this.inactiveBorderColor,
    required this.focusedBorderColor,
    required this.errorBorderColor,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.hintTextFontWeight = FontWeight.w500,
    required this.hintTextColor,
    this.labelTextFontWeight = FontWeight.w500,
    required this.labelTextColor,
    this.suffixIcon,
    this.loading = false,
    this.showCursor = true,
    this.radius = 10,
    this.controller,
    this.focusNode,
    this.labelText,
    this.hintText,
    this.onTapLabel,
    this.verticalContentPadding = 23,
    this.alignment =  AlignmentDirectional.topStart,
    required this.enabledColor,
    required this.enabledBorderColor,
    required this.enabledFocusedBorderColor,
  });

  final OnChanged onChanged;
  final bool enabled;
  final List<TextInputFormatter> inputFormatters;
  final TextInputType textInputType;
  final String? hintText;
  final bool autofocus;
  final bool hasError;
  final bool isPassword;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  final String? labelText;
  final double radius;
  final TextAlign textAlign;
  final Color textColor;
  final FontWeight textFontWeight;
  final Color inactiveBorderColor;
  final Color focusedBorderColor;
  final Color errorBorderColor;
  final FloatingLabelBehavior floatingLabelBehavior;
  final FontWeight hintTextFontWeight;
  final Color hintTextColor;
  final FontWeight labelTextFontWeight;
  final Color labelTextColor;
  final double verticalContentPadding;
  final Widget? suffixIcon;
  final bool loading;
  final Color enabledColor;
  final Color enabledBorderColor;
  final Color enabledFocusedBorderColor;
  final bool showCursor;
  final AlignmentGeometry alignment;
  final VoidCallback? onTapLabel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: alignment,
      children: [
        TextField(
          readOnly: !enabled,
          autocorrect: false,
          showCursor: enabled && showCursor,
          textInputAction: textInputAction,
          controller: controller,
          focusNode: focusNode,
          obscureText: isPassword,
          autofocus: autofocus,
          keyboardType: textInputType,
          onChanged: onChanged,
          inputFormatters: inputFormatters,
          textAlign: textAlign,
          style: TextStyle(
              fontWeight: textFontWeight,
              fontSize: 20,
              color: textColor,
            ),
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            filled: true,
            // fillColor: enabled ? cInputBorderDisabledColor : enabledColor,
            floatingLabelBehavior: floatingLabelBehavior,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              borderSide: BorderSide(
                width: 20,
                color:
                enabled ? inactiveBorderColor : enabledBorderColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              borderSide: BorderSide(
                width: 20,
                color:
                enabled ? inactiveBorderColor : enabledBorderColor,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              borderSide: BorderSide(
                width: 20,
                color:
                enabled ? inactiveBorderColor : enabledBorderColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              borderSide: BorderSide(
                width: 20,
                color:
                enabled ? focusedBorderColor : enabledFocusedBorderColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              borderSide: BorderSide(
                width: 20,
                color: errorBorderColor,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              borderSide: BorderSide(
                width: 2,
                color: errorBorderColor,
              ),
            ),
            errorText: hasError ? '' : null,
            errorStyle: const TextStyle(fontSize: 0, height: -8),
            hintText: hintText,
            hintStyle: TextStyle(
                fontSize: 20,
                fontWeight: hintTextFontWeight,
                color: hintTextColor,
              ),
            labelStyle: TextStyle(
                fontSize: 20,
                color: labelTextColor,
                fontWeight: labelTextFontWeight,
              ),
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 22,
              vertical: verticalContentPadding,
            ),
          ),
        ),
      ],
    );
  }
}
