import 'package:flutter/material.dart';

import '../widgets/ProfileViewBody.dart';

class ProfileView extends StatelessWidget {
  final void Function(int index) onTabChange;
  const ProfileView({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ProfileViewBody(onTabChange :onTabChange)),
    );
  }
}
