import 'package:flutter/widgets.dart';

import '../styles/textStyles.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;
  const CustomErrorWidget({super.key, required String this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Error occured ${message}',
        style: TextStyles.semiBold16,
      ),
    );
  }
}
