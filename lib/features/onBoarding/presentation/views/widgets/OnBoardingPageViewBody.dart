import 'package:e_commerce/features/onBoarding/presentation/views/widgets/PageViewItem.dart';
import 'package:flutter/material.dart';

import '../../../../../Core/utils/constants/assetsImages.dart';

class OnBoardingPageViewBody extends StatelessWidget {
  const OnBoardingPageViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(children: const [
        PageViewItem(
            backGroundImage: Assets.assetsImagesBackGround1,
            image: Assets.assetsImagesOnBoarding1,
            subTitle:
                "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(" مرحبًا بك في",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text(
                  " Fruit",
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                Text("HUB",
                    style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        fontSize: 24)),
              ],
            )),
        PageViewItem(
            backGroundImage: Assets.assetsImagesBackGround2,
            image: Assets.assetsImagesOnBoarding2,
            subTitle:
                "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("ابحث وتسوق",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ],
            )),
      ]),
    );
  }
}
