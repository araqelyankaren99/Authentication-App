import 'package:flutter/cupertino.dart';
import 'package:flutter_authentication_app/src/data/repository/user.dart';
import 'package:flutter_authentication_app/src/domain/entity/user.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mobx/mobx.dart';

part 'store.g.dart';

enum AuthMode { login, signup }

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with mobx.Store {
  final UserRepository _userRepository;

  _LoginStoreBase(this._userRepository);

  @mobx.action
  Future<void> addUser() async {
    if (username.isEmpty || password.isEmpty || email.isEmpty) {
      hasUsernameError = username.isEmpty;
      hasEmailError = email.isEmpty;
      hasPasswordError = password.isEmpty;
      errorMessage = 'Please fill fields';
      return;
    }

    hasPasswordError = false;
    hasUsernameError = false;
    hasEmailError = false;

    try {
      isLoading = true;
      final user = User(
        username: username,
        password: password,
        email: email,
      );
      await _userRepository.addUser(user);
      currentUser = user;
      errorMessage = null;
    } catch (e) {
      currentUser = null;
    } finally {
      isLoading = false;
    }
  }

  @mobx.action
  Future<User?> getUser() async {
    if (username.isEmpty || password.isEmpty) {
      hasUsernameError = username.isEmpty;
      hasPasswordError = password.isEmpty;
      errorMessage = 'Please fill fields';
      return null;
    }

    hasUsernameError = false;
    hasPasswordError = false;

    try {
      isLoading = true;
      final user = await _userRepository.getUser(username, password);
      currentUser = user;
      errorMessage = null;
    } catch (e) {
      currentUser = null;
      errorMessage = null;
    } finally {
      isLoading = false;
    }
    return currentUser;
  }

  @mobx.observable
  User? currentUser;

  @mobx.observable
  String? errorMessage;

  @mobx.observable
  String username = '';

  @mobx.observable
  TextEditingController usernameController = TextEditingController();

  @mobx.observable
  TextEditingController passwordController = TextEditingController();

  @mobx.observable
  TextEditingController emailController = TextEditingController();

  @mobx.observable
  String password = '';

  @mobx.observable
  String email = '';

  @mobx.observable
  bool hasUsernameError = false;

  @mobx.observable
  bool hasPasswordError = false;

  @mobx.observable
  bool hasEmailError = false;


  @mobx.observable
  AuthMode authMode = AuthMode.login;

  @mobx.observable
  bool isLoading = false;

  @mobx.action
  Future<void> forgetPassword() async {}


  @mobx.action
  void onUsernameChanged(String username){
    this.username = username;
    hasUsernameError = false;
  }

  @mobx.action
  void onPasswordChanged(String password){
    this.password = password;
    hasPasswordError = false;
  }

  @mobx.action
  void onEmailChanged(String email){
    this.email = email;
    hasEmailError = false;
  }

  @mobx.action
  void onLoginSelectorTap() {
    email = '';
    password = '';
    username = '';
    hasPasswordError = false;
    hasUsernameError = false;
    hasEmailError = false;
    authMode = AuthMode.login;
    emailController.clear();
    passwordController.clear();
    usernameController.clear();
  }

  @mobx.action
  void onSignUpButtonSelectorTap(){
    email = '';
    password = '';
    username = '';
    hasPasswordError = false;
    hasUsernameError = false;
    hasEmailError = false;
    authMode = AuthMode.signup;
    emailController.clear();
    passwordController.clear();
    usernameController.clear();
  }
}