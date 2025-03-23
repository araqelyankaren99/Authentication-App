import 'package:flutter_authentication_app/objectbox.g.dart' as objectbox;
import 'package:flutter_authentication_app/objectbox.g.dart';
import 'package:flutter_authentication_app/src/domain/entity/user.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mobx/mobx.dart';

part 'store.g.dart';

enum AuthMode { login, signup }

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with mobx.Store {
  final objectbox.Box<User> _userBox;

  _LoginStoreBase(this._userBox);

  @mobx.observable
  User? currentUser;

  @mobx.observable
  String username = '';

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
  Future<void> addUser() async {
    if(username.isEmpty || password.isEmpty || email.isEmpty){
      hasUsernameError = username.isEmpty;
      hasEmailError = email.isEmpty;
      hasPasswordError = password.isEmpty;
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
      await _userBox.putAsync(user);
    }
    finally {
      isLoading = false;
    }
  }

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
  Future<User?> onLoginTap() async{
    if(authMode == AuthMode.login){
      final user = await getUser();
      return user;
    }
    email = '';
    password = '';
    username = '';
    hasPasswordError = false;
    hasUsernameError = false;
    hasEmailError = false;
    authMode = AuthMode.login;
    return null;
  }

  @mobx.action
  Future<void> onSignUpButtonTapTap() async{
    if(authMode == AuthMode.signup){
      await addUser();
      return;
    }
    email = '';
    password = '';
    username = '';
    hasPasswordError = false;
    hasUsernameError = false;
    hasEmailError = false;
    authMode = AuthMode.signup;
  }

  @mobx.action
  Future<User?> getUser() async {
    if(username.isEmpty || password.isEmpty){
      hasUsernameError = username.isEmpty;
      hasPasswordError = password.isEmpty;
      return null;
    }
    hasUsernameError = false;
    hasPasswordError = false;

      try {
        isLoading = true;
      final query = _userBox
          .query(User_.username.equals(username) & User_.password.equals(password))
          .build();
      final user = query.findFirst();
      query.close();

      if (user != null) {
        currentUser = user;
      } else {
        currentUser = null;
      }
    } catch (e) {
      currentUser = null;
    }
    finally {
        isLoading = false;
    }
    return currentUser;

  }
}