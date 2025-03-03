import 'package:flutter/material.dart';

import '../../../../../../Core/utils/styles/textStyles.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final void Function() onPress;
  const CustomAppBar({
    super.key,
    required this.title,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: Localizations.localeOf(context).languageCode == 'ar'
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          child: IconButton(
            onPressed: onPress,
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
        const SizedBox(
          width: 85,
        ),
        Center(
          child: Text(title, style: TextStyles.bold19),
        ),
        const Spacer(),
      ],
    );
  }
}
