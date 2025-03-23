import 'package:flutter_authentication_app/objectbox.g.dart';
import 'package:flutter_authentication_app/src/domain/entity/user.dart' show User;

abstract class UserRepository {
  Future<void> addUser(User user);

  Future<User> getUser(String username , String password);
}

class UserRepositoryImpl extends UserRepository {
  final Box<User> _userBox;

  UserRepositoryImpl(this._userBox);

  @override
  Future<void> addUser(User user) async {
    await _userBox.putAsync(user);
  }

  @override
  Future<User> getUser(String username, String password) async {
    final query = _userBox
        .query(User_.username.equals(username) & User_.password.equals(password))
        .build();
    final user = query.findFirst();
    query.close();

    if (user == null) {
      throw Exception('User not found or credentials invalid');
    }
    return user;
  }
}