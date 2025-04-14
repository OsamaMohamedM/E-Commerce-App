import '../../../Auth/Data/entity/User.dart';

abstract class ProfileUpdateState {}

class ProfileUpdateInitial extends ProfileUpdateState {}

class ProfileUpdateLoading extends ProfileUpdateState {}

class ProfileUpdateSuccess extends ProfileUpdateState {
  final UserData userData;

  ProfileUpdateSuccess(this.userData);
}

class ProfileUpdateFailure extends ProfileUpdateState {
  final String message;

  ProfileUpdateFailure(this.message);
}
