import 'package:e_commerce/Core/utils/styles/app_colors.dart';
import 'package:e_commerce/Core/utils/styles/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        color: Colors.grey[300],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: ShapeDecoration(
              color: AppColors.darkPrimaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(image),
            ),
          ),
          const SizedBox(width: 5),
          Flexible(
              child: Center(
                  child: Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyles.semiBold11.copyWith(
              color: AppColors.darkPrimaryColor,
            ),
          ))),
        ],
      ),
    );
  }
}
