import 'package:flutter/material.dart';


import '../assetsImages.dart';
import 'BottomNavigationBarItem.dart';


class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabChange;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(22),
          topRight: Radius.circular(22),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x19000000),
            spreadRadius: 0,
            blurRadius: 25,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomBottomNavigationBarItem(
              index: 0,
              currentIndex: currentIndex,
              onTabChange: onTabChange,
              inActiveImage: Assets.assetsImagesHome,
              activeImage: Assets.assetsImagesHomeBold,
              name: 'الرئيسية',
            ),
            CustomBottomNavigationBarItem(
              index: 1,
              currentIndex: currentIndex,
              onTabChange: onTabChange,
              inActiveImage: Assets.assetsImagesProductsOutLine,
              activeImage: Assets.assetsImagesProductsBold,
              name: 'المنتجات',
            ),
            CustomBottomNavigationBarItem(
              index: 2,
              currentIndex: currentIndex,
              onTabChange: onTabChange,
              inActiveImage: Assets.assetsImagesShoppingcartOutLine,
              activeImage: Assets.assetsImagesShoppingcartOutLine,
              name: 'سلة المشتريات',
            ),
            CustomBottomNavigationBarItem(
              index: 3,
              currentIndex: currentIndex,
              onTabChange: onTabChange,
              inActiveImage: Assets.assetsImagesUserOutLine,
              activeImage: Assets.assetsImagesUserBold,
              name: 'الحساب',
            ),
          ],
        ),
      ),
    );
  }
}




