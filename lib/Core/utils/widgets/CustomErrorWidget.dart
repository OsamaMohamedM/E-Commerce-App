import 'package:flutter/widgets.dart';

import '../styles/textStyles.dart';

class CustomErrorWidget extends StatelessWidget {
const CustomErrorWidget({ super.key });

  @override
  Widget build(BuildContext context){
    return Center(
      child: Text('Error occured', style: TextStyles.semiBold16,),
    );
  }
}