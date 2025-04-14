import 'dart:developer';

import 'package:e_commerce/features/Cart/view_model/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Core/utils/constants/assetsImages.dart';
import '../../../../Core/utils/styles/textStyles.dart';

class CustomAppBarHomeView extends StatelessWidget {
  const CustomAppBarHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    log("${context.read<CartCubit>().userData?.image ?? "osmaa"}");
    final imageUrl = context.read<CartCubit>().userData?.image;
    return ListTile(
      leading:  imageUrl!= null && imageUrl.isNotEmpty
          ? ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                context.read<CartCubit>().userData!.image!,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ))
          : SvgPicture.asset(
              Assets.assetsImagesUserPhoto,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
      title: Text(
        fetchAppBarData(),
        style: TextStyles.regular16.copyWith(color: Color(0xff949D9E)),
        textAlign: TextAlign.start,
      ),
      subtitle: Text(
        context.read<CartCubit>().userData?.name ?? 'اسم المستخدم',
        style: TextStyles.bold16,
      ),
      trailing: Container(
        padding: EdgeInsets.all(14),
        decoration:
            ShapeDecoration(shape: OvalBorder(), color: Color(0xFFEEF8ED)),
        child: SvgPicture.asset(
          Assets.assetsImagesNotification,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  fetchAppBarData() {
    final now = DateTime.now();
    if (now.hour >= 0 && now.hour < 12) {
      return 'صباح الخير 🌞';
    } else
      return 'مساء الخير🌙';
  }
}
