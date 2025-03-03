import 'package:e_commerce/Core/Services/SharedPrefrences.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../Core/AppRoutes.dart';
import '../../../../../Core/utils/constants/strings.dart';
import '../../../../../Core/utils/widgets/CustomButton.dart';
import 'CustomDotsIndecator.dart';
import 'OnBoardingPageViewBody.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        OnBoardingPageViewBody(
          pageController: pageController,
        ),
        CustomDotsIndicator(
          num: 2,
          currentPage: currentPage,
        ),
        const SizedBox(
          height: 29,
        ),
        Visibility(
          maintainAnimation: true,
          maintainState: true,
          maintainSize: true,
          visible: (currentPage == 1) ? true : false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomButton(
              onPressed: () {
                SharedPreferencesHelper.setBool(kisOnBoardingViewSeen, true);
                GoRouter.of(context).pushReplacement(Approutes.loginView);
              },
              buttonName: "ابدأ الان",
            ),
          ),
        ),
        const SizedBox(
          height: 43,
        ),
      ],
    ));
  }
}
