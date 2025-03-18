import 'package:flutter/material.dart';

import '../widgets/HomViewBody.dart';

class HomeView extends StatelessWidget {
const HomeView({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(child: HomViewBody()),
    );
  }
}