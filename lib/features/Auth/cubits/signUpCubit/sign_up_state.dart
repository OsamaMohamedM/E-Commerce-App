part of 'sign_up_cubit.dart';

abstract class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final UserData user;
  SignUpSuccess(this.user);
}

final class SignUpFailure extends SignUpState {
  final String message;
  SignUpFailure(this.message);
}

final class SignUpLoading extends SignUpState {}


