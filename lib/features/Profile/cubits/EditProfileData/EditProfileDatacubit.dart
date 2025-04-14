
import 'package:e_commerce/Core/Services/AuthService.dart';
import 'package:e_commerce/features/Auth/Data/entity/User.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'EditProfileDatastate.dart';

class EditProfileDataCubit extends Cubit<ProfileUpdateState> {
  final AuthService authService;
  EditProfileDataCubit({required this.authService}) : super(ProfileUpdateInitial());

  Future<void> updateProfile({
    String? displayName,
    String? newEmail,
    String? newPassword,
    String? currentPassword, 
  }) async {
    emit(ProfileUpdateLoading());
    try {
      final result = await authService.updateProfile(
        displayName: displayName,
        newEmail: newEmail,
        newPassword: newPassword,
        currentPassword: currentPassword,
      );

      result.fold(
        (failure) => emit(ProfileUpdateFailure(failure.message)),
        (r) => emit(ProfileUpdateSuccess(UserData.fromJson(
          {
            'displayName': displayName,
            'email':newEmail,
            'password': newPassword,
          }
        ))),
      );
    }
    catch (e) {
      emit(ProfileUpdateFailure('Failed to update profile: $e'));
    }
  }
}
