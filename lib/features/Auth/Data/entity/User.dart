import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  final String name;
  final String password;
  final String email;
  final String id;
  final String? image;
  UserData(
      {required this.name,
      this.image,
      required this.password,
      required this.email,
      required this.id});

  factory UserData.fromFirebase(User user) {
    return UserData(
        image: user.photoURL ?? '',
        name: user.displayName ?? '',
        email: user.email ?? '',
        password: '',
        id: user.uid);
  }

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        image: json['image']??'',
        name: json['name']??'',
        password: json['password']??'',
        email: json['email']?? '',
        id: json['id']??'',
      );
  toMap() => {'name': name, 'email': email, 'id': id};

  UserData copyWith({
    UserData? userData,
  }){
    return UserData(
      name: userData?.name ?? name,
      password: userData?.password ?? password,
      email: userData?.email ?? email,
      id: userData?.id ?? id,
      image: userData?.image ?? image,
    );
  }
  get getName => name;
  get getPassword => password;
  get getEmail => email;
  get getId => id;
}
