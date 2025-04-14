import 'dart:convert';

import 'package:e_commerce/Core/AppRoutes.dart';
import 'package:e_commerce/features/Cart/view_model/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Core/Services/SharedPrefrences.dart';
import '../../../../../Core/utils/constants/assetsImages.dart';
import '../../../../../Core/utils/constants/strings.dart';
import '../../../../Auth/Data/entity/User.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    _navigateToOnBoarding();
  }

  void _navigateToOnBoarding()async {
    final user =
       await SharedPreferencesHelper.getValue(userPref); //as Map<String, dynamic>?;    
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        if (user != null) {
          context.read<CartCubit>().userData  = UserData.fromJson(jsonDecode(user));
          GoRouter.of(context).go(AppRoutes.homeView);
        } else {
         GoRouter.of(context).go(AppRoutes.loginView);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment:
              Localizations.localeOf(context).languageCode == 'ar'
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
          children: [
            Image.asset(Assets.assetsImagesPlant),
          ],
        ),
        SvgPicture.asset(Assets.assetsImagesLogo),
        SvgPicture.asset(
          Assets.assetsImagesSplashBottom,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
