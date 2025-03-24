import 'package:e_commerce/features/Cart/Presentation/views/CartView.dart';
import 'package:flutter/material.dart';

import '../../../../Core/utils/widgets/CustomBottomNavigationBar.dart';
import '../../../ProductView/Presentation/view/ProductView.dart';
import 'HomView.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;

  final List<Widget> pages = [
    HomeView(),
    ProductView(),
    CartView(),
    Center(child: Text("الحساب")),
  ];

  void onTabChange(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTabChange: onTabChange,
      ),
      body: SafeArea(
        child: IndexedStack(
          index: currentIndex,
          children: pages,
        ),
      ),
    );
  }
}
