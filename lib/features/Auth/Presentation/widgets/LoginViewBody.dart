import 'package:e_commerce/features/Auth/Presentation/widgets/SocialLoginOptionsSection.dart';
import 'package:e_commerce/features/Auth/cubits/signInCubit/cubit/sign_in_cubit.dart';
import 'package:e_commerce/features/Cart/view_model/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/features/Auth/Presentation/widgets/LoginFormSection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../Core/AppRoutes.dart';
import '../../../../Core/utils/styles/textStyles.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<SignInCubit, SignInState>(listener: (context, state) {
        if (state is SignInFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
          ));
        } else if (state is SignInSuccess) {
          context.read<CartCubit>().userData = state.user;
           GoRouter.of(context).go(AppRoutes.mainView);
        }
      }, builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignInLoading,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const LoginFormSection(),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "نسيت كلمة المرور؟",
                        style: TextStyles.semiBold13,
                      ),
                    )
                  ]),
                  const SocialLoginOptionsSection(),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
