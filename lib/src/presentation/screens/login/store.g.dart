// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStoreBase {
  late final _$currentUserAtom =
      Atom(name: '_LoginStoreBase.currentUser', context: context);

  @override
  User? get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(User? value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  late final _$usernameAtom =
      Atom(name: '_LoginStoreBase.username', context: context);

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_LoginStoreBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_LoginStoreBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$hasUsernameErrorAtom =
      Atom(name: '_LoginStoreBase.hasUsernameError', context: context);

  @override
  bool get hasUsernameError {
    _$hasUsernameErrorAtom.reportRead();
    return super.hasUsernameError;
  }

  @override
  set hasUsernameError(bool value) {
    _$hasUsernameErrorAtom.reportWrite(value, super.hasUsernameError, () {
      super.hasUsernameError = value;
    });
  }

  late final _$hasPasswordErrorAtom =
      Atom(name: '_LoginStoreBase.hasPasswordError', context: context);

  @override
  bool get hasPasswordError {
    _$hasPasswordErrorAtom.reportRead();
    return super.hasPasswordError;
  }

  @override
  set hasPasswordError(bool value) {
    _$hasPasswordErrorAtom.reportWrite(value, super.hasPasswordError, () {
      super.hasPasswordError = value;
    });
  }

  late final _$hasEmailErrorAtom =
      Atom(name: '_LoginStoreBase.hasEmailError', context: context);

  @override
  bool get hasEmailError {
    _$hasEmailErrorAtom.reportRead();
    return super.hasEmailError;
  }

  @override
  set hasEmailError(bool value) {
    _$hasEmailErrorAtom.reportWrite(value, super.hasEmailError, () {
      super.hasEmailError = value;
    });
  }

  late final _$authModeAtom =
      Atom(name: '_LoginStoreBase.authMode', context: context);

  @override
  AuthMode get authMode {
    _$authModeAtom.reportRead();
    return super.authMode;
  }

  @override
  set authMode(AuthMode value) {
    _$authModeAtom.reportWrite(value, super.authMode, () {
      super.authMode = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_LoginStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$addUserAsyncAction =
      AsyncAction('_LoginStoreBase.addUser', context: context);

  @override
  Future<void> addUser() {
    return _$addUserAsyncAction.run(() => super.addUser());
  }

  late final _$getUserAsyncAction =
      AsyncAction('_LoginStoreBase.getUser', context: context);

  @override
  Future<User?> getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  late final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase', context: context);

  @override
  void onUsernameChanged(String username) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.onUsernameChanged');
    try {
      return super.onUsernameChanged(username);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onPasswordChanged(String password) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.onPasswordChanged');
    try {
      return super.onPasswordChanged(password);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onEmailChanged(String email) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.onEmailChanged');
    try {
      return super.onEmailChanged(email);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onLoginSelectorTap(){
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.onLoginTap');
    try {
      return super.onLoginSelectorTap();
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onSignUpButtonSelectorTap() async{
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.onSignUpButtonTapTap');
    try {
      return super.onSignUpButtonSelectorTap();
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentUser: ${currentUser},
username: ${username},
password: ${password},
email: ${email},
hasUsernameError: ${hasUsernameError},
hasPasswordError: ${hasPasswordError},
hasEmailError: ${hasEmailError},
authMode: ${authMode},
isLoading: ${isLoading}
    ''';
  }
}
