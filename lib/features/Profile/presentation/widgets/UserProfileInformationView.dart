import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Core/utils/assetsImages.dart';
import '../../../../Core/utils/styles/app_colors.dart';
import '../../../../Core/utils/styles/textStyles.dart';
import '../../../Cart/view_model/cubit/cart_cubit.dart';

class UserProfileInformationView extends StatelessWidget {
  const UserProfileInformationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user  = context.read<CartCubit>().userData;
    return Row(
      children: [
        Stack(
          children: [
             CircleAvatar(
              radius: 50,
              backgroundImage: user!.image != null
                  ? CachedNetworkImageProvider(user.image!)
                  : const AssetImage(Assets.assetsImagesProfileTest),
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
              user.name,
              style: TextStyles.bold13,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              user.email,
              style: TextStyles.bold13,
            )
          ],
        ),
      ],
    );
  }
}
