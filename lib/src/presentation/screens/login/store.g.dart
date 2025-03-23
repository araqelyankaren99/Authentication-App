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

  late final _$errorMessageAtom =
      Atom(name: '_LoginStoreBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$addUserAsyncAction =
      AsyncAction('_LoginStoreBase.addUser', context: context);

  @override
  Future<void> addUser(String username, String password, String email) {
    return _$addUserAsyncAction
        .run(() => super.addUser(username, password, email));
  }

  late final _$getUserAsyncAction =
      AsyncAction('_LoginStoreBase.getUser', context: context);

  @override
  Future<void> getUser(String username, String password) {
    return _$getUserAsyncAction.run(() => super.getUser(username, password));
  }

  @override
  String toString() {
    return '''
currentUser: ${currentUser},
errorMessage: ${errorMessage}
    ''';
  }
}
