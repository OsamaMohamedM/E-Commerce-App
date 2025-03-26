import 'package:flutter/material.dart';

import '../../../../Core/utils/styles/app_colors.dart';
import '../../../../Core/utils/styles/textStyles.dart';

class ShippingItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final String price;
  final bool isSelected;
  final void Function()? onTap;
  const ShippingItem(
      {super.key,
      required this.onTap,
      required this.title,
      required this.subTitle,
      required this.price,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.only(
          top: 16,
          bottom: 13,
          left: 28,
          right: 16,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
            color: Color(0x33D9D9D9),
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 1,
                    color: (isSelected
                        ? AppColors.darkPrimaryColor
                        : Colors.transparent)),
                borderRadius: BorderRadius.circular(4))),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isSelected ? ActiveDot() : InActiveDot(),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style:
                          TextStyles.semiBold13.copyWith(color: Colors.black)),
                  const SizedBox(height: 6),
                  Text(subTitle,
                      style: TextStyles.regular13
                          .copyWith(color: Colors.black.withOpacity(.5))),
                ],
              ),
              const Spacer(),
              Center(
                  child: Text(price,
                      style: TextStyles.bold13
                          .copyWith(color: AppColors.lightPrimaryColor))),
            ],
          ),
        ),
      ),
    );
  }
}

class InActiveDot extends StatelessWidget {
  const InActiveDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: const ShapeDecoration(
        shape: OvalBorder(side: BorderSide(width: 1, color: Color(0xFF949D9E))),
      ),
    );
  }
}

class ActiveDot extends StatelessWidget {
  const ActiveDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: const ShapeDecoration(
        color: AppColors.darkPrimaryColor,
        shape: OvalBorder(side: BorderSide(width: 4, color: Colors.white)),
      ),
    );
  }
}
