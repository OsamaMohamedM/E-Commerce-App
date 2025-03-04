import 'package:flutter/material.dart';
import '../widgets/LoginViewBody.dart';

class LoginView extends StatelessWidget {
const LoginView({ super.key });

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: LoginViewBody(),
    );
  }
}