import 'package:flutter/material.dart';

import '../../../../Core/utils/styles/textStyles.dart';

class PaymentItem extends StatelessWidget {
  final String title;
  final Widget child;
  const PaymentItem({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            const SizedBox(
              height: 8,
            ),
            Text(title, style: TextStyles.bold13,),
            const SizedBox(
              height: 8,
            ),
            Container(
                decoration: ShapeDecoration(
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),)
                     ),
                     child: child,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                  Text('عنوان التوصيل',style: TextStyles.bold13,),
                  const Spacer(),
                  Icon(Icons.edit_square , color: Color(0xff949D9E),),
                  const SizedBox(width : 4),
                  Text('تعديل',style: TextStyles.semiBold13.copyWith(color: Color(0xff949D9E)),),
              ],
            ),
            const SizedBox(height: 8,),
            Row(
              children: [
                  Icon(Icons.location_on , color: Color(0xff292D32),),
                  Text('78 القاهرة الجديده شارع صلاح سالم',style: TextStyles.bold13,),
                
              ],
            ),

        ],
    );
  }
}
