import 'package:e_commerce/Core/Services/AuthService.dart';
import 'package:e_commerce/Core/Services/get_it.dart';
import 'package:e_commerce/features/Cart/view_model/cubit/cart_cubit.dart';
import 'package:e_commerce/features/Profile/cubits/EditProfileData/EditProfileDatacubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/EditProfileData/EditProfileDatastate.dart';
import '../widgets/EditProfileDataViewBody.dart';

class EditProfileDataView extends StatelessWidget {
  final void Function(int index) onTabChange;
  const EditProfileDataView({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          EditProfileDataCubit(authService: getIt.get<AuthService>()),
      child: Scaffold(
        body: SafeArea(
            child: BlocConsumer<EditProfileDataCubit, ProfileUpdateState>(
          listener: (context, state) {
            if (state is ProfileUpdateSuccess) {
              context.read<CartCubit>().userData!.copyWith(userData: state.userData);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Profile updated successfully!'),
                ),
              );
            } else if (state is ProfileUpdateFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          builder: (context, state) {
            return EditProfileDataViewBody(
              onTabChange: onTabChange,
            );
          },
        )),
      ),
    );
  }
}
