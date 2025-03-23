

import 'package:e_commerce/features/Home/Presentation/widgets/HomeViewBody.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.of(context).size.width - 32;
    return HomeViewBody(itemWidth: itemWidth);
  }
}







