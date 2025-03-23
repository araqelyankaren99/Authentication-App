import 'package:objectbox/objectbox.dart';

@Entity() // Marks this class as an ObjectBox entity
class User {
  @Id() // Unique identifier managed by ObjectBox
  int id = 0; // Default to 0; ObjectBox will assign a unique ID

  final String username;
  final String password;
  final String email;

  User({
    required this.username,
    required this.password,
    required this.email,
  });
}