import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Core/utils/assetsImages.dart';
import '../../../../Core/utils/styles/textStyles.dart';
import '../widgets/HomViewBody.dart' show BestSellingHeader;
import '../widgets/TopSellingGridView.dart';

class BestSallerView extends StatelessWidget {
  const BestSallerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BestSellerViewBody()),
    );
  }
}

class BestSellerViewBody extends StatelessWidget {
  const BestSellerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomAppBartBestSeller(),
      const SizedBox(height: 24,),
      BestSellingHeader(),
      TopSellingGridView(),

    ]);
  }
}

class CustomAppBartBestSeller extends StatelessWidget {
  const CustomAppBartBestSeller({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Best Seller' , style: TextStyles.bold19.copyWith(color: Colors.black),
      textAlign: TextAlign.center,),
      trailing: Container(
        padding: EdgeInsets.all(14),
        decoration:
            ShapeDecoration(shape: OvalBorder(), color: Color(0xFFEEF8ED)),
        child: SvgPicture.asset(
          Assets.assetsImagesNotification,
          fit: BoxFit.fill,
        ),
      ),
      leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){},),
    );
  }
}
