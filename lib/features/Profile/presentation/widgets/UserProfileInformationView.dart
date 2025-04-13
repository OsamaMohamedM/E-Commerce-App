import 'package:flutter/material.dart';

import '../../../../Core/utils/assetsImages.dart';
import '../../../../Core/utils/styles/app_colors.dart';
import '../../../../Core/utils/styles/textStyles.dart';

class UserProfileInformationView extends StatelessWidget {
  const UserProfileInformationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(Assets.assetsImagesProfileTest),
            ),
            Transform.translate(
                offset: const Offset(-25, 80),
                child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: AppColors.darkPrimaryColor,
                    ))),
          ],
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "محمد علي",
              style: TextStyles.bold13,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "wHbZP@example.com",
              style: TextStyles.bold13,
            )
          ],
        ),
      ],
    );
  }
}
