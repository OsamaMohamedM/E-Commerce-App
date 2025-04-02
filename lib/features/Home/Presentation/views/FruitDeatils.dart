import 'package:flutter/material.dart';

import '../widgets/FruitDetailsBody.dart';

class FruitDetails extends StatelessWidget {
const FruitDetails({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:SafeArea(child: FruitDetailsBody()) ,
    );
  }
}