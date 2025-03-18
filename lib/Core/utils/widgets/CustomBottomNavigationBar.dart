import 'package:e_commerce/Core/utils/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../assetsImages.dart';
import '../styles/textStyles.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

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
        padding: const EdgeInsets.symmetric(horizontal:14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomNavigationBarItem(
              inActiveImage: Assets.assetsImagesHome,
              activeImage: Assets.assetsImagesHomeBold,
              isActive: true,
              name: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              inActiveImage: Assets.assetsImagesProductsOutLine,
              activeImage: Assets.assetsImagesProductsBold,
              isActive: false,
              name: 'المنتجات',
            ),
            BottomNavigationBarItem(
              inActiveImage: Assets.assetsImagesShoppingcartOutLine,
              activeImage: Assets.assetsImagesShoppingcartOutLine,
              isActive: false,
              name: 'سلة المشتريات',
            ),
            BottomNavigationBarItem(
              inActiveImage: Assets.assetsImagesUserOutLine,
              activeImage: Assets.assetsImagesUserBold,
              isActive: false,
              name: 'الحساب',
            ),
          ],
        ),
      ),
    );
  }
}

class InActiveBottomNavigationBar extends StatelessWidget {
  final String image;
  final String name;

  const InActiveBottomNavigationBar(
      {super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(image, width: 24, height: 24);
  }
}

class ActiveBottomNavigationBar extends StatelessWidget {
  final String image;
  final String name;

  const ActiveBottomNavigationBar(
      {super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(35)),
        color: Colors.grey[300],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: ShapeDecoration(
              color: AppColors.darkPrimaryColor,
              shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(35)),
            ),
            child: SvgPicture.asset(image),
          ),
          const SizedBox(width: 5),
          Align(alignment: Alignment.center,child: Text(name, style: TextStyles.semiBold11.copyWith(color: AppColors.darkPrimaryColor))),
        ],
      ),
    );
  }
}

class BottomNavigationBarItem extends StatelessWidget {
  final String inActiveImage;
  final String activeImage;
  final bool isActive;
  final String name;

  const BottomNavigationBarItem({
    super.key,
    required this.inActiveImage,
    required this.isActive,
    required this.name,
    required this.activeImage,
  });

  @override
  Widget build(BuildContext context) {
    return isActive
        ? ActiveBottomNavigationBar(image: activeImage, name: name)
        : InActiveBottomNavigationBar(image: inActiveImage, name: name);
  }
}
