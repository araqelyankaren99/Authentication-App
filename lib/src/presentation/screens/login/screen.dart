import 'package:flutter/material.dart';
import 'package:flutter_authentication_app/src/config/navigation/route_names.dart';
import 'package:flutter_authentication_app/src/config/theme/theme.dart';
import 'package:flutter_authentication_app/src/presentation/screens/login/store.dart';
import 'package:flutter_authentication_app/src/presentation/widgets/custom_input.dart';
import 'package:flutter_authentication_app/src/presentation/widgets/empty.dart';
import 'package:flutter_authentication_app/src/presentation/widgets/forget_button.dart';
import 'package:flutter_authentication_app/src/presentation/widgets/keyboard_dismissable.dart';
import 'package:flutter_authentication_app/src/presentation/widgets/login_and_sign_up_button.dart';
import 'package:flutter_authentication_app/src/presentation/widgets/wave_clipper.dart';
import 'package:flutter_authentication_app/src/utils/resources/texts.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

LoginStore? _loginStore;

void _setLoginStore(LoginStore? store) => _loginStore = store;

LoginStore getLoginStore() => _loginStore!;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginStore _userStore;

  @override
  void initState() {
    super.initState();
    _userStore = GetIt.I<LoginStore>();
    _setLoginStore(_userStore);
  }

  @override
  void dispose() {
    _setLoginStore(null);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppThemeExtension>();
    return Scaffold(
      backgroundColor: theme?.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: const Stack(
        children: [
          KeyboardDismissibleWidget(
            child: Column(
              children: [
                _TopWidget(),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 75),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _UsernameInputWidget(),
                          _PasswordInputWidget(),
                          _EmailInputWidget(),
                          _LoginButton(),
                          _SignUpButton(),
                          _LoginAndSignUpButtonWidget(),
                          _ForgetButtonWidget(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          _LoaderWidget(),
        ],
      ),
    );
  }
}

class _TopWidget extends StatelessWidget {
  const _TopWidget();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppThemeExtension>()!;
    return Expanded(
      child: Stack(
        children: [
          ClipPath(
            clipper: WaveClipper(),
            child: SizedBox.expand(child: ColoredBox(color: theme.waveColor)),
          ),
          const _LogoImageWidget(),
        ],
      ),
    );
  }
}

class _LoaderWidget extends StatelessWidget {
  const _LoaderWidget();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final store = getLoginStore();
        final theme = Theme.of(context).extension<AppThemeExtension>()!;
        return store.isLoading
            ? SizedBox.expand(
              child: ColoredBox(
                color: theme.backgroundColor.withAlpha(
                  (0.5 * 255).toInt(),
                ),
                child: const Center(child: CircularProgressIndicator()),
              ),
            )
            : const EmptyWidget();
      },
    );
  }
}

class _UsernameInputWidget extends StatelessWidget {
  const _UsernameInputWidget();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final store = getLoginStore();
        return CustomInputWidget(
          controller: store.usernameController,
          onChanged: store.onUsernameChanged,
          hintText: AppTexts.usernameHintText,
          hasError: store.hasUsernameError,
        );
      },
    );
  }
}

class _PasswordInputWidget extends StatelessWidget {
  const _PasswordInputWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Observer(
        builder: (_) {
          final store = getLoginStore();
          return CustomInputWidget(
            controller: store.passwordController,
            onChanged: store.onPasswordChanged,
            isPassword: true,
            hintText: AppTexts.passwordHintText,
            hasError: store.hasPasswordError,
          );
        },
      ),
    );
  }
}

class _EmailInputWidget extends StatelessWidget {
  const _EmailInputWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Observer(
        builder: (_) {
          final store = getLoginStore();
          return store.authMode == AuthMode.signup
              ? CustomInputWidget(
                controller: store.emailController,
                onChanged: store.onEmailChanged,
                hintText: AppTexts.emailHintText,
                hasError: store.hasEmailError,
              )
              : const EmptyWidget();
        },
      ),
    );
  }
}

class _LoginAndSignUpButtonWidget extends StatelessWidget {
  const _LoginAndSignUpButtonWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30),
      child: Observer(
        builder: (_) {
          final store = getLoginStore();
          final theme = Theme.of(context).extension<AppThemeExtension>()!;

          return LoginAndSignUpButton(
            authMode: store.authMode,
            onLoginTap: store.onLoginSelectorTap,
            onSignUpTap: store.onSignUpButtonSelectorTap,
            activeColor: theme.loginAndSignUpButtonActiveColor,
            inactiveColor: theme.loginAndSignUpButtonInactiveColor,
            textActiveColor: theme.loginAndSignUpButtonActiveTextColor,
            textInactiveColor: theme.loginAndSignUpButtonInactiveTextColor,
            loginText: AppTexts.loginButtonText,
            signUpText: AppTexts.signUpButtonText,
          );
        },
      ),
    );
  }
}

class _LogoImageWidget extends StatelessWidget {
  const _LogoImageWidget();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 25, left: 12),
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }
}

class _ForgetButtonWidget extends StatelessWidget {
  const _ForgetButtonWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Center(
        child: ForgetButtonWidget(onTap: getLoginStore().forgetPassword),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final store = getLoginStore();
        final theme = Theme.of(context).extension<AppThemeExtension>()!;
        return store.authMode == AuthMode.login
            ? ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  theme.loginAndSignUpButtonActiveColor,
                ),
                foregroundColor: WidgetStateProperty.all(
                  theme.loginAndSignUpButtonActiveTextColor,
                ),
              ),
              onPressed: () => _onLoginButtonTap(context),
              child: Text(
                AppTexts.loginButtonText,
                style: TextStyle(
                  color: theme.loginAndSignUpButtonActiveTextColor,
                ),
              ),
            )
            : const EmptyWidget();
      },
    );
  }

  Future<void> _onLoginButtonTap(BuildContext context) async {
    final store = getLoginStore();
    final user = await store.getUser();
    if (store.errorMessage != null) {
      return;
    }

    if (user != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(AppTexts.userNotFound),),);
      return;
    }
    Navigator.of(context).pushNamedAndRemoveUntil(
      MainNavigationRouteNames.home,
      (_) => false,
      arguments: user,
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Observer(
        builder: (_) {
          final store = getLoginStore();
          final theme = Theme.of(context).extension<AppThemeExtension>()!;
          return store.authMode == AuthMode.signup
              ? ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    theme.loginAndSignUpButtonInactiveColor,
                  ),
                  foregroundColor: WidgetStateProperty.all(
                    theme.loginAndSignUpButtonInactiveTextColor,
                  ),
                ),
                onPressed: () => _onSignUpButtonTap(context),
                child: Text(AppTexts.signUpButtonText,style: TextStyle(color: theme.loginAndSignUpButtonInactiveTextColor),),
              )
              : const EmptyWidget();
        },
      ),
    );
  }

  Future<void> _onSignUpButtonTap(BuildContext context) async {
    try {
      await getLoginStore().addUser();
    } on Exception catch (error) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error.toString())));
    }
    final store = getLoginStore();
    if (store.errorMessage != null) {
      return;
    }
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(AppTexts.userAdded)));
  }
}
