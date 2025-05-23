import 'package:flutter/material.dart';

import 'widgets/SplashViewBody.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SplashViewBody()),
    );
  }
}
