import 'package:flutter/material.dart';
import 'SignUpFormSection.dart';

class SignUpViewBody extends StatelessWidget {
const SignUpViewBody({ super.key });

  @override
  Widget build(BuildContext context){
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          children: [
            SignUpFormSection(),
            // const SeparatorRow(),
            // const SignUpTextRow(),
          ],
        ),
      ),
    );
  }
}