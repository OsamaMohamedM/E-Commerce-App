import 'package:flutter/material.dart';

import '../../../../Core/utils/styles/textStyles.dart';

class AddressDetails extends StatelessWidget {
  final String address;
  final void Function()? onPressed;
  const AddressDetails({
    super.key,
    required this.address,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'عنوان التوصيل',
              style: TextStyles.bold13,
            ),
            const Spacer(),
            IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.edit_square,
                color: Color(0xff949D9E),
              ),
            ),
            const SizedBox(width: 4),
            Text(
              'تعديل',
              style: TextStyles.semiBold13.copyWith(color: Color(0xff949D9E)),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: Color(0xff292D32),
            ),
            Text(
              address,
              style: TextStyles.bold13,
            ),
          ],
        ),
      ],
    );
  }
}
