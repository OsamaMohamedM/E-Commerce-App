import 'package:flutter/material.dart';
import '../../../../../Core/utils/widgets/CustomButton.dart';
import '../../../../../Core/utils/widgets/CustomDotsIndecator.dart';
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
        const OnBoardingPageViewBody(),
        const CustomDotsIndicator(num: 2),
        const SizedBox(
          height: 29,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomButton(
            onPressed: () {},
            buttonName: "ابدأ الان",
          ),
        ),
        const SizedBox(
          height: 43,
        ),
      ],
    ));
  }
}


