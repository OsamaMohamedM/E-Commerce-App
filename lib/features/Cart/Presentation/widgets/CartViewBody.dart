import 'package:e_commerce/features/Cart/Data/models/CartEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../Core/AppRoutes.dart';
import '../../../../Core/utils/styles/app_colors.dart';
import '../../../../Core/utils/widgets/CustomAppBar.dart';
import '../../view_model/cubit/cart_cubit.dart';
import 'CartItem.dart';
import 'CartResult.dart';

class CartViewBody extends StatelessWidget {
  final CartEntity cartEntity;
  const CartViewBody({super.key, required this.cartEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.5, vertical: 16),
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const CustomAppBar(tittle: 'السلة', visibleTrailing: false),
                    const SizedBox(height: 26),
                    CartResult(num: cartEntity.cartItemEntityList.length),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
              SliverList.builder(
                itemCount: cartEntity.cartItemEntityList.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    Divider(
                      color: AppColors.customTextFieldBorder,
                    ),
                    SizedBox(
                        width: double.infinity,
                        height: 150,
                        child: CustomCartItem(
                            cartItemEntity:
                                cartEntity.cartItemEntityList[index])),
                    Divider(
                      color: AppColors.customTextFieldBorder,
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 100),
              )
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ElevatedButton(
              onPressed: () {
                if (context.read<CartCubit>().getNumberOfItems() > 0) {
                  GoRouter.of(context).push(AppRoutes.checkOutView,
                      extra: context.read<CartCubit>().cartEntity);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('السلة فارغة'),
                  ));
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: AppColors.myAmberColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                cartEntity.clcTotal().toString(),
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
