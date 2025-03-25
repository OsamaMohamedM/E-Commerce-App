import 'package:flutter/material.dart';

import '../widgets/CheckOutBody.dart';

class CheckOut extends StatelessWidget {
const CheckOut({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: CheckOutBody(),
    );
  }
}