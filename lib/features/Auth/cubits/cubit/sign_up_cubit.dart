import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/Auth/Data/entity/User.dart';
import 'package:e_commerce/features/Auth/Data/repos/authRepo.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepo _authRepo;
  SignUpCubit(this._authRepo) : super(SignUpInitial());

  Future<void> createUserWithEmailPassword(
      {required String email,
      required String password,
      required String name}) async {
    emit(SignUpLoading());
    final result = await _authRepo.createUserWithEmailPassword(
        email: email, password: password, name: name);
    result.fold((user) => emit(SignUpSuccess(user)),
        (failure) => emit(SignUpFailure(failure.message)));
  }
}
