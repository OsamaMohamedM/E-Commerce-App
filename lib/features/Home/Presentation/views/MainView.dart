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
    Center(child: Text("سلة المشتريات")),
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
