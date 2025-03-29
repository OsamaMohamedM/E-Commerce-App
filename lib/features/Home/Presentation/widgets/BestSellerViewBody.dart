import 'package:flutter/material.dart';

import '../../../../Core/utils/widgets/CustomAppBar.dart';
import 'BestSellingHeader.dart';

class BestSellerViewBody extends StatelessWidget {
  const BestSellerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomAppBar(
        tittle: "الاكثر مبيعا",
      ),
      const SizedBox(
        height: 24,
      ),
      BestSellingHeader(),
      // TopSellingGridView(),
    ]);
  }
}
