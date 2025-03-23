import 'package:flutter_authentication_app/objectbox.g.dart';
import 'user.dart'; // Import your User class

late Store store;

void initStore() {
  store = openStore();
}

Box<User> getUserBox() => store.box<User>();