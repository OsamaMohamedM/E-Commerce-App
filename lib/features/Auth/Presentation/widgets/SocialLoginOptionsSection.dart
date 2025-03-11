import 'package:flutter/material.dart';
import 'package:e_commerce/Core/utils/constants/assetsImages.dart';
import 'package:e_commerce/features/Auth/Presentation/widgets/CustomSocialButton.dart';
import 'package:e_commerce/features/Auth/Presentation/widgets/SeparatorRow.dart';
import 'package:e_commerce/features/Auth/Presentation/widgets/SignUpTextRow.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/signInCubit/cubit/sign_in_cubit.dart';

class SocialLoginOptionsSection extends StatelessWidget {
  const SocialLoginOptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SignUpTextRow(),
        const SizedBox(height: 33),
        const SeparatorRow(),
        const SizedBox(height: 13),
        CustomSocialButton(
            title: "تسجيل الدخول بحساب جوجل",
            onPressed: () {
              context.read<SignInCubit>().signInWithGoogle();
            },
            imageUrl: Assets.assetsImagesGoogle),
        const SizedBox(height: 13),
        CustomSocialButton(
            title: "تسجيل بواسطة أبل",
            onPressed: () {},
            imageUrl: Assets.assetsImagesAppleIcon),
        const SizedBox(height: 13),
        CustomSocialButton(
            title: "تسجيل بواسطة فيسبوك",
            onPressed: () {},
            imageUrl: Assets.assetsImagesFaceBookIcon),
      ],
    );
  }
}
