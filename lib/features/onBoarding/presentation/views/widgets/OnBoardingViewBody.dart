import 'package:e_commerce/Core/utils/assetsImages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return const PageViewItem(
          backGroundImage: Assets.assetsImagesBackGround1,
          image: Assets.assetsImagesOnBoarding1,
          subTitle:"اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
          title: Row(
            children: [
              Text("مرحبًا بك في"),
              Text("Fruit" , style: TextStyle(color: Colors.green , fontWeight: FontWeight.bold,fontSize:18),),
              Text("HUB", style: TextStyle(color: Colors.amber , fontWeight: FontWeight.bold,fontSize:18)),

            ],
          )
        );
      },
    );
  }
}

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key, required this.backGroundImage, required this.image, required this.subTitle, required this.title});
  final String backGroundImage, image;
  final String subTitle;
  final Widget title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
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
                  bottom: 0, left: 0, right: 0, child: SvgPicture.asset(image))
            ],
          ),
        ),
        title,
        Text(subTitle),     
      ],
    );
  }
}
