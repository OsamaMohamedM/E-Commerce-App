import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce/Core/utils/assetsImages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../Core/utils/app_colors.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: PageView( 
              children :const [
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
                    subTitle:"نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("ابحث وتسوق",
                            style:
                                TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            
                      ],
                    )),
                    
              ]
            ),
          ),
        
         DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            color: AppColors.primaryColor.withOpacity(0.5),
          ),

         )
        ],
      )
    );
  }
}

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.backGroundImage,
      required this.image,
      required this.subTitle,
      required this.title});
  final String backGroundImage, image;
  final String subTitle;
  final Widget title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                  child: SvgPicture.asset(
                backGroundImage,
                fit: BoxFit.fill,
              )),
              Positioned(
                  bottom: 0, left: 0, right: 0, child: SvgPicture.asset(image)),
              const Padding(
                padding:  EdgeInsets.all(12.0),
                child:  Text('تخط',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 64,
        ),
        title,
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding:const EdgeInsets.symmetric(horizontal:12.0),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style :const TextStyle(fontSize: 18 , fontFamily: 'Cairo')
          ),
        ),
      ],
    );
  }
}
/**
 * 
 * 
 * 




*/