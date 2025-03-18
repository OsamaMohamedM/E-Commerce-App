import 'package:flutter/material.dart';

import '../../../../Core/utils/widgets/CustomBottomNavigationBar.dart';
import '../widgets/HomViewBody.dart';

class HomeView extends StatelessWidget {
const HomeView({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: SafeArea(child: HomViewBody()),
    );
  }
}