import 'package:flutter_authentication_app/objectbox.g.dart' as objectbox;
import 'package:flutter_authentication_app/objectbox.g.dart';
import 'package:flutter_authentication_app/src/domain/entity/user.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mobx/mobx.dart';

// Generate with: flutter pub run build_runner build
part 'store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with mobx.Store {
  final objectbox.Box<User> _userBox;

  _LoginStoreBase(this._userBox);

  @mobx.observable
  User? currentUser;

  @mobx.observable
  String? errorMessage;

  @mobx.action
  Future<void> addUser(String username, String password, String email) async {
    try {
      final user = User(
        username: username,
        password: password,
        email: email,
      );
      await _userBox.putAsync(user);
      errorMessage = null;
    } catch (e) {
      errorMessage = 'Failed to add user: $e';
    }
  }

  @mobx.action
  Future<void> getUser(String username, String password) async {
    try {
      final query = _userBox
          .query(User_.username.equals(username) & User_.password.equals(password))
          .build();
      final user = query.findFirst();
      query.close();

      if (user != null) {
        currentUser = user;
        errorMessage = null;
      } else {
        currentUser = null;
        errorMessage = 'User not found or credentials invalid';
      }
    } catch (e) {
      currentUser = null;
      errorMessage = 'Error fetching user: $e';
    }
  }
}