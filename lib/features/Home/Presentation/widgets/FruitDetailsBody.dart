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
import '../../../../Core/utils/widgets/CustomAppBar.dart';
import '../../../Cart/view_model/cubit/cart_cubit.dart';

class FruitDetailsBody extends StatelessWidget {
  final ProductEntity product;
  const FruitDetailsBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom:14.0),
        child: Column(
          children: [
            Container(
              height: 340,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.assetsImagesCurveDetails ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  CustomAppBar(
                    tittle: "",
                    visibleLeading: true,
                    visibleTrailing: false,
                  ),
                  Center(
                    child: Image.network(
                      product.image!,
                      fit: BoxFit.fill,
                      height: 200,
                      width: 200,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            CustomFruitDetails(product: product),
          ],
        ),
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
          RatingAndReview(product: widget.product),
          const SizedBox(height: 8),
          Text(
            widget.product.description,
            style: TextStyles.regular13.copyWith(color: Color(0xFF9796A1)),
          ),
          const SizedBox(height: 16),
          InfoCardGrid(
            product: widget.product,
          ),
          const SizedBox(height: 24),
          CustomButton(
              onPressed: () {
                if (counter > 0) {
                  BlocProvider.of<CartCubit>(context)
                      .addToCart(widget.product, counter: counter);
                } else {
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

class RatingAndReview extends StatelessWidget {
  final ProductEntity product;
  const RatingAndReview({
    super.key,
    required this.product,
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
          '${product.avgRating}',
          style: TextStyles.semiBold13,
        ),
        const SizedBox(width: 9),
        Text(
          '${product.ratingCount}',
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

class InfoCardGrid extends StatelessWidget {
  final ProductEntity product;

  const InfoCardGrid({super.key, required this.product});
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
          _buildCard(Icons.calendar_today, product.expirationMonths.toString(),
              "الصلاحية", Icon(Icons.calendar_today)),
          _buildCard(Icons.eco, product.isOrganic ? "نعم" : "لا", "أوجانيك",
              SvgPicture.asset(Assets.assetsImagesLotus, fit: BoxFit.fill)),
          _buildCard(
              Icons.local_fire_department,
              product.calories.toString(),
              "100 جرام",
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
