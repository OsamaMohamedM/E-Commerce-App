import 'package:e_commerce/features/onBoarding/presentation/views/widgets/PageViewItem.dart';
import 'package:flutter/material.dart';

import '../../../../../Core/utils/constants/assetsImages.dart';
import '../../../../../Core/utils/styles/app_colors.dart';
import '../../../../../Core/utils/styles/textStyles.dart';

class OnBoardingPageViewBody extends StatelessWidget {
  const OnBoardingPageViewBody({
    super.key,
    required this.pageController,
  });
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(controller: pageController, children: [
        PageViewItem(
            visible: true,
            backGroundImage: Assets.assetsImagesBackGround1,
            image: Assets.assetsImagesOnBoarding1,
            subTitle:
                "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(" مرحبًا بك في", style: TextStyles.bold23),
                Text(
                  " Fruit",
                  style: TextStyles.bold23
                      .copyWith(color: AppColors.darkPrimaryColor),
                ),
                Text("HUB",
                    style: TextStyles.bold23
                        .copyWith(color: AppColors.myAmberColor)),
              ],
            )),
        const PageViewItem(
            visible: false,
            backGroundImage: Assets.assetsImagesBackGround2,
            image: Assets.assetsImagesOnBoarding2,
            subTitle:
                "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("ابحث وتسوق", style: TextStyles.semiBold16),
              ],
            )),
      ]),
    );
  }
}
