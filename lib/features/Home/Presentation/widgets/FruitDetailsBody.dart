import 'package:e_commerce/Core/utils/assetsImages.dart';
import 'package:e_commerce/Core/utils/styles/textStyles.dart';
import 'package:e_commerce/Core/utils/widgets/CustomButton.dart';
import 'package:e_commerce/Core/utils/widgets/FruitItemName.dart';

import 'package:e_commerce/features/Home/Presentation/widgets/QuantityItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../Core/Data/Model/ProductEntity.dart';
import '../../../../Core/utils/styles/app_colors.dart';
import '../../../Cart/view_model/cubit/cart_cubit.dart';

class FruitDetailsBody extends StatelessWidget {
  static ProductEntity product = ProductEntity(
      name: 'بطيخ',
      price: 20,
      image: Assets.assetsImagesWaterMellonTest,
      code: '',
      isFeatured: true,
      expirationMonths: 6,
      isOrganic: true,
      unitAmount: 1,
      description:
          'ينتمي إلى الفصيلة القرعية ولثمرته لُب حلو المذاق وقابل للأكل، وبحسب علم النبات فهي تعتبر ثمار لبيّة، تستعمل لفظة البطيخ للإشارة إلى النبات نفسه أو إلى الثمرة تحديداً');
  const FruitDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.assetsImagesCurveDetails),
                fit: BoxFit.fill,
              ),
            ),
            child: Center(
              child: Image.asset(
                Assets.assetsImagesTest,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          CustomFruitDetails(product: product),
        ],
      ),
    );
  }
}

class CustomFruitDetails extends StatefulWidget {
  const CustomFruitDetails({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  State<CustomFruitDetails> createState() => _CustomFruitDetailsState();
}

class _CustomFruitDetailsState extends State<CustomFruitDetails> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FruitItemName(
                product: widget.product,
                textStyle: TextStyles.bold16,
              ),
              const Spacer(),
              QuantityItem(
                counter: counter,
                onIncrement: () {
                  counter++;
                  setState(() {});
                },
                onDecrement: () {
                  if (counter == 0) return;
                  counter--;
                  setState(() {});
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          RatingAndReview(),
          const SizedBox(height: 8),
          Text(
            widget.product.description,
            style: TextStyles.regular13.copyWith(color: Color(0xFF9796A1)),
          ),
          const SizedBox(height: 16),
          InfoCardGrid(),
          const SizedBox(height: 24),
          CustomButton(
              onPressed: () {
                if(counter>0) {
                  BlocProvider.of<CartCubit>(context).addToCart(widget.product  , counter :counter);
                } else
                {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('يرجى اختيار كمية'),
                      
                    ),
                  );
                }
              },
              buttonName: 'اضف الي السلة'),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class InfoCardGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 1.6,
        children: [
          _buildCard(Icons.calendar_today, "عام", "الصلاحية",
              Icon(Icons.calendar_today)),
          _buildCard(Icons.eco, "100%", "أوجانيك",
              SvgPicture.asset(Assets.assetsImagesLotus, fit: BoxFit.fill)),
          _buildCard(Icons.local_fire_department, "80 كالوري", "100 جرام",
              SvgPicture.asset(Assets.assetsImagesCalories, fit: BoxFit.fill)),
          _buildCard(
              Icons.star,
              "4.8 (256)",
              "Reviews",
              SvgPicture.asset(Assets.assetsImagesFavourites,
                  fit: BoxFit.fill)),
        ],
      ),
    );
  }

  Widget _buildCard(
      IconData icon, String title, String subtitle, Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5,
              spreadRadius: 1)
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 22, horizontal: 18),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff23AA49))),
              Text(subtitle,
                  style: TextStyle(fontSize: 14, color: Colors.grey)),
            ],
          ),
          SizedBox(width: 16),
          child,
        ],
      ),
    );
  }
}

class RatingAndReview extends StatelessWidget {
  const RatingAndReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.amber,
        ),
        const SizedBox(width: 9),
        Text(
          '4.5',
          style: TextStyles.semiBold13,
        ),
        const SizedBox(width: 9),
        Text(
          '(+30)',
          style: TextStyles.regular13.copyWith(color: Color(0xFF9796A1)),
        ),
        const SizedBox(width: 9),
        Text('المراجعه',
            style: TextStyles.bold13.copyWith(
                color: AppColors.darkPrimaryColor,
                decoration: TextDecoration.underline)),
      ],
    );
  }
}
