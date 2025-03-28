import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/utils/styles/textStyles.dart';
import '../../Data/models/Order.dart';
import 'PaymentItem.dart';

class CustomOrderSummary extends StatelessWidget {
  const CustomOrderSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PaymentItem(title: 'ملخص الطلب : ', 
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8,),
        Row(
          children: [
            Text('المجموع الفرعي' ,style: TextStyles.regular13.copyWith(color: Color(0xff4E5556)),),
            const Spacer(),
            Text('${context.read<Order>().cartEntity.clcTotal()} جنيه' ,style: TextStyles.semiBold16, textAlign: TextAlign.right,),
          ],
        ),
        const SizedBox(height: 8,),
        Row(
          children: [
            Text('التوصيل : ' ,style: TextStyles.regular13.copyWith(color: Color(0xff4E5556)),),
            const Spacer(),
            Text('${context.read<Order>().payWithCash! ? 0.00 : 20.00} جنيه' ,style: TextStyles.regular13.copyWith(color: Color(0xff4E5556)), textAlign: TextAlign.right,),
          ],
        ),
        SizedBox(height: 9,),
        Divider(thickness: 0.5 ,height: 18,),
        SizedBox(height: 9,),
        Row(
          children: [
            Text('الكلي : ' ,style: TextStyles.bold16.copyWith(color: Color(0xff4E5556)),),
            const Spacer(),
            Text('${context.read<Order>().cartEntity.clcTotal()+20} جنيه' ,style: TextStyles.bold16.copyWith(color: Color(0xff4E5556)), textAlign: TextAlign.right,),
          ],
        ),
        SizedBox(height: 15,),
      ],
    ));
  }
}