import 'package:e_commerce/Core/utils/widgets/InActiveBottomNavigationBar.dart';
import 'package:flutter/material.dart';

import 'ActiveBottomNavigationBar.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  final String inActiveImage;
  final String activeImage;
  final String name;
  final int index;
  final int currentIndex;
  final Function(int) onTabChange;

  const CustomBottomNavigationBarItem({
    super.key,
    required this.inActiveImage,
    required this.activeImage,
    required this.name,
    required this.index,
    required this.currentIndex,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTabChange(index),
      child: currentIndex == index
          ? ActiveBottomNavigationBar(image: activeImage, name: name)
          : InActiveBottomNavigationBar(image: inActiveImage, name: name),
    );
  }
}
