import 'package:e_commerce/Core/utils/widgets/CustomHomeButton.dart';
import 'package:flutter/material.dart';

import '../../../../Core/utils/styles/textStyles.dart';

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
            child: CustomHomeButton(
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
