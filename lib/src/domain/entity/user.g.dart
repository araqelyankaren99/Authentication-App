import 'dart:io';

import 'package:flutter_authentication_app/objectbox.g.dart' as objectbox;
import 'package:path_provider/path_provider.dart';
import 'user.dart'; // Import your User class

late objectbox.Store store;

Future<void> initStore() async {
  // Get the app's documents directory
  final directory = await getApplicationDocumentsDirectory();
  final dbPath = '${directory.path}/objectbox'; // Custom directory for ObjectBox

  // Ensure the directory exists
  await Directory(dbPath).create(recursive: true);

  // Open the store with the specified directory
  store = objectbox.openStore(directory: dbPath);
}

objectbox.Box<User> getUserBox() => store.box<User>();