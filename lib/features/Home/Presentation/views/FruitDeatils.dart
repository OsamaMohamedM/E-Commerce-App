import 'package:flutter/material.dart';

import '../../../../Core/Data/Model/ProductEntity.dart';
import '../widgets/FruitDetailsBody.dart';

class FruitDetails extends StatelessWidget {
  final ProductEntity product;
const FruitDetails({ super.key, required this.product });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:SafeArea(child: FruitDetailsBody(product: product,)) ,
    );
  }
}