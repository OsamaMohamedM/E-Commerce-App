import 'package:e_commerce/Core/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Core/Services/SharedPrefrences.dart';
import '../../../../../Core/utils/constants/assetsImages.dart';
import '../../../../../Core/utils/constants/strings.dart';

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

  void _navigateToOnBoarding() {
    final isOnBoardingViewSeen =
        SharedPreferencesHelper.getValue(kisOnBoardingViewSeen) ?? false;
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        if (isOnBoardingViewSeen == true) {
          GoRouter.of(context).pushReplacement(AppRoutes.loginView);
        } else {
          GoRouter.of(context).pushReplacement(AppRoutes.onBoardingView);
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
