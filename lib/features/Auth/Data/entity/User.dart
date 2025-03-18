import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  final String name;
  final String password;
  final String email;
  final String id;
  UserData(
      {required this.name,
      required this.password,
      required this.email,
      required this.id});

  factory UserData.fromFirebase(User user) {
    return UserData(
        name: user.displayName ?? '',
        email: user.email ?? '',
        password: '',
        id: user.uid);
  }

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        name: json['name'],
        password: json['password'],
        email: json['email'],
        id: json['id'],
      );
  toMap() => {'name': name, 'password': password, 'email': email, 'id': id};
  get getName => name;
  get getPassword => password;
  get getEmail => email;
  get getId => id;
}
