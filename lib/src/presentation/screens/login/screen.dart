import 'package:flutter/material.dart';
import 'package:flutter_authentication_app/src/domain/entity/user.g.dart';
import 'package:flutter_authentication_app/src/presentation/screens/login/store.dart';
import 'package:flutter_authentication_app/src/presentation/widgets/custom_input.dart';
import 'package:flutter_authentication_app/src/utils/resources/colors.dart';
import 'package:flutter_authentication_app/src/utils/resources/texts.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final userStore = LoginStore(getUserBox());

    return Scaffold(
      appBar: AppBar(title: const Text('MobX with ObjectBox')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Observer(
              builder:
                  (_) => CustomInputWidget(
                    onChanged: userStore.onUsernameChanged,
                    textColor: AppColors.hintTextLightColor,
                    borderColor: AppColors.borderLightColor,
                    errorBorderColor: AppColors.errorLightColor,
                    hintText: AppTexts.usernameHintText,
                    hasError: userStore.hasUsernameError,
                  ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12),
              child: Observer(
                builder:
                    (_) => CustomInputWidget(
                      onChanged: userStore.onPasswordChanged,
                      isPassword: true,
                      textColor: AppColors.hintTextLightColor,
                      borderColor: AppColors.borderLightColor,
                      errorBorderColor: AppColors.errorLightColor,
                      hintText: AppTexts.passwordHintText,
                      hasError: userStore.hasPasswordError,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12),
              child: Observer(
                builder:
                    (_) => CustomInputWidget(
                      onChanged: userStore.onEmailChanged,
                      textColor: AppColors.hintTextLightColor,
                      borderColor: AppColors.borderLightColor,
                      errorBorderColor: AppColors.errorLightColor,
                      hintText: AppTexts.emailHintText,
                      hasError: userStore.hasEmailError,
                    ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await userStore.addUser();
              },
              child: const Text('Add User'),
            ),
            ElevatedButton(
              onPressed: () async {
                await userStore.getUser();
              },
              child: const Text('Get User'),
            ),
            const SizedBox(height: 20),
            Observer(
              builder:
                  (_) => Column(
                    children: [
                      if (userStore.currentUser != null)
                        Text(
                          'User: ${userStore.currentUser!.username}, ${userStore.currentUser!.email}',
                        )
                      else
                        const Text('No user found'),
                      if (userStore.errorMessage != null)
                        Text(
                          userStore.errorMessage!,
                          style: const TextStyle(color: Colors.red),
                        ),
                    ],
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
