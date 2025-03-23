import 'package:flutter/material.dart';
import 'package:flutter_authentication_app/src/config/navigation/route_names.dart';
import 'package:flutter_authentication_app/src/domain/entity/user.g.dart';
import 'package:flutter_authentication_app/src/presentation/screens/login/store.dart';
import 'package:flutter_authentication_app/src/presentation/widgets/custom_input.dart';
import 'package:flutter_authentication_app/src/presentation/widgets/empty.dart';
import 'package:flutter_authentication_app/src/presentation/widgets/keyboard_dismissable.dart';
import 'package:flutter_authentication_app/src/presentation/widgets/login_and_sign_up_button.dart';
import 'package:flutter_authentication_app/src/presentation/widgets/wave_clipper.dart';
import 'package:flutter_authentication_app/src/utils/resources/colors.dart';
import 'package:flutter_authentication_app/src/utils/resources/texts.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
    _userStore = LoginStore(getUserBox());
    _setLoginStore(_userStore);
  }

  @override
  void dispose() {
    _setLoginStore(null);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
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
                          _LoginAndSignUpButtonWidget(),
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
    return const Expanded(
      child: Stack(
        children: [
          ClipPath(
            clipper: WaveClipper(),
            child: SizedBox.expand(child: ColoredBox(color: AppColors.waveLightColor),),
          ),
          _LogoImageWidget(),
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
        return store.isLoading
            ? SizedBox.expand(
              child: ColoredBox(
                color: AppColors.backgroundLightColor.withAlpha(
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
          onChanged: store.onUsernameChanged,
          textColor: AppColors.hintTextLightColor,
          borderColor: AppColors.borderLightColor,
          errorBorderColor: AppColors.errorLightColor,
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
            onChanged: store.onPasswordChanged,
            isPassword: true,
            textColor: AppColors.hintTextLightColor,
            borderColor: AppColors.borderLightColor,
            errorBorderColor: AppColors.errorLightColor,
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
                onChanged: store.onEmailChanged,
                textColor: AppColors.hintTextLightColor,
                borderColor: AppColors.borderLightColor,
                errorBorderColor: AppColors.errorLightColor,
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
          return LoginAndSignUpButton(
            authMode: store.authMode,
            onLoginTap: () => _onLoginTap(context),
            onSignUpTap: () => _onSignUpButtonTap(context),
            activeColor: Color(0xFF1A5CFF),
            inactiveColor: Colors.lightBlue,
            textActiveColor: Colors.white,
            textInactiveColor: Colors.black,
            loginText: 'Login',
            signUpText: 'Sign Up',
          );
        },
      ),
    );
  }

  Future<void> _onLoginTap(BuildContext context) async {
    final user = await getLoginStore().onLoginTap();
    if (user != null) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        MainNavigationRouteNames.home,
        (_) => false,
        arguments: user,
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('User not found')));
    }
  }

  Future<void> _onSignUpButtonTap(BuildContext context) async {
    await getLoginStore().onSignUpButtonTapTap();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('User added successfully')));
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
