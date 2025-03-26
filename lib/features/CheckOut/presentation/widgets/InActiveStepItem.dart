import 'package:e_commerce/Core/utils/styles/textStyles.dart';
import 'package:flutter/material.dart';

import '../../../../Core/utils/styles/app_colors.dart';

class InActiveStepItem extends StatelessWidget {
const InActiveStepItem({ super.key });

  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        CircleAvatar(
          radius: 10,
          
          backgroundColor: AppColors.darkPrimaryColor,
          child: const Text('2' , style: TextStyles.semiBold13,),
        ),
        const SizedBox(width: 4,),
        Text(
          'الشحن',
          style: TextStyles.semiBold13.copyWith(color: Color(0xffAAAAAA)),
        )
      ],
    );
  }
}