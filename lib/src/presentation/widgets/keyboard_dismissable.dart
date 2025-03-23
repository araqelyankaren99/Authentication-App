import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KeyboardDismissibleWidget extends StatelessWidget with KeyboardMixin {
  const KeyboardDismissibleWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => hideKeyboard(context),
      child: child,
    );
  }
}

mixin KeyboardMixin {
  Future<void> showKeyboard() async {
    await SystemChannels.textInput.invokeMethod('TextInput.show');
  }

  Future<void> hideKeyboard(BuildContext context) async {
    FocusScope.of(context).unfocus();
    await SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
}