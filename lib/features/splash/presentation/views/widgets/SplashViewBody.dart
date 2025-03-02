import 'package:e_commerce/Core/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Core/utils/assetsImages.dart';

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
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        GoRouter.of(context).pushReplacement(Approutes.onBoardingView);
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
