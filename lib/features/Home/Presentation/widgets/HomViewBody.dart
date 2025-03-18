import 'package:e_commerce/Core/utils/assetsImages.dart';
import 'package:e_commerce/Core/utils/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../Core/utils/styles/textStyles.dart';
import 'TopSellingGridView.dart';

class HomViewBody extends StatelessWidget {
  const HomViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.of(context).size.width - 32;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: Column(
            children: [
              CustomAppBarHomeView(),
              const SizedBox(
                height: 26,
              ),
              CustomSearchFiled(),
              SizedBox(
                  height: 200, child: ListFeaturedItem(itemWidth: itemWidth)),
              const SizedBox(
                height: 12,
              ),
              BestSellingHeader(),
              const SizedBox(
                height: 12,
              ),              
            ],
          )),
          TopSellingGridView(),
        ],
      ),
    );
  }
}









class ListFeaturedItem extends StatelessWidget {
  const ListFeaturedItem({
    super.key,
    required this.itemWidth,
  });

  final double itemWidth;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: FeaturedItem(itemWidth: itemWidth),
      ),
    );
  }
}

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'الأكثر مبيعًا',
          style: TextStyles.bold16.copyWith(color: Colors.black),
        ),
        Spacer(),
        InkWell(
          onTap: () {},
          child: Text(
            'المزيد',
            style: TextStyles.semiBold13.copyWith(color: Colors.white24),
          ),
        ),
      ],
    );
  }
}

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({
    super.key,
    required this.itemWidth,
  });

  final double itemWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: itemWidth,
      child: AspectRatio(
        aspectRatio: 342 / 158,
        child: Stack(children: [
          Positioned(
            left: 0,
            bottom: 0,
            top: 0,
            right: itemWidth * 0.45,
            child: Image.asset(
              Assets.assetsImagesTest,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            width: itemWidth * 0.5,
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(Assets.assetsImagesWaterMellonTest),
              fit: BoxFit.fill,
            )),
            child: FeaturedItemText(),
          )
        ]),
      ),
    );
  }
}

class FeaturedItemText extends StatelessWidget {
  const FeaturedItemText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 33.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25,
          ),
          Text('عروض العيد',
              style: TextStyles.bold19.copyWith(color: Colors.white)),
          Spacer(),
          Text('خصم 25%',
              style: TextStyles.bold19.copyWith(color: Colors.white)),
          SizedBox(
            height: 11,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: CustomButton(
              buttonName: "تسوق الان",
              onPressed: () {},
            ),
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}

class CustomSearchFiled extends StatelessWidget {
  const CustomSearchFiled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
            prefixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            suffixIcon: IconButton(
              icon: SvgPicture.asset(Assets.assetsImagesSetting4),
              onPressed: () {},
            ),
            hintText: '...ابحث عن',
            hintStyle: TextStyles.regular13.copyWith(color: Color(0xff949D9E)),
            fillColor: Colors.white,
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder()));
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: Color(0xff949D9E), width: 1),
    );
  }
}

class CustomAppBarHomeView extends StatelessWidget {
  const CustomAppBarHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        Assets.assetsImagesUserPhoto,
        width: 40,
        height: 40,
        fit: BoxFit.cover,
      ),
      title: Text(
        'صباح الخير',
        style: TextStyles.regular16.copyWith(color: Color(0xff949D9E)),
        textAlign: TextAlign.start,
      ),
      subtitle: Text(
        'اسامه محمد',
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
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
  });
  final String buttonName;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          onPressed: onPressed,
          child: FittedBox(
            child: Text(buttonName,
                textAlign: TextAlign.center,
                style: TextStyles.bold16
                    .copyWith(color: AppColors.lightPrimaryColor)),
          )),
    );
  }
}
