import 'package:e_commerce/Core/utils/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/utils/styles/textStyles.dart';
import '../../cubits/checkOutCubit/cubit/check_out_cubit.dart';
import 'PaymentItem.dart';

class PaymentSection extends StatelessWidget {
  final PageController pageController;
  const PaymentSection({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {

    return PaymentItem(
        title: 'ملخص الطلب : ',
        pageController: pageController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text(
                  'المجموع الفرعي',
                  style:
                      TextStyles.regular13.copyWith(color: Color(0xff4E5556)),
                ),
                const Spacer(),
                Text(
                  '${context.read<CheckOutCubitCubit>().orderEntity.cartEntity.clcTotal()} جنيه',
                  style: TextStyles.semiBold16,
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text(
                  'التوصيل : ',
                  style: TextStyles.regular13
                      .copyWith(color: AppColors.darkGrayColor),
                ),
                const Spacer(),
                Text(
                  
                 '${context.read<CheckOutCubitCubit>().orderEntity.payWithCash! ? 0.00 : 20.00} جنيه',
                  style: TextStyles.regular13
                      .copyWith(color: AppColors.darkGrayColor),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            SizedBox(
              height: 9,
            ),
            Divider(
              thickness: 0.5,
              height: 18,
            ),
            SizedBox(
              height: 9,
            ),
            Row(
              children: [
                Text(
                  'الكلي : ',
                  style: TextStyles.bold16
                      .copyWith(color: AppColors.darkGrayColor),
                ),
                const Spacer(),
                Text(
                  '${context.read<CheckOutCubitCubit>().orderEntity.cartEntity.clcTotal() + 20} جنيه',
                  style: TextStyles.bold16
                      .copyWith(color: AppColors.darkGrayColor),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ));
  }
}
