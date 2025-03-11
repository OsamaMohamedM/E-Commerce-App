import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/Auth/Data/entity/User.dart';

import '../../../Data/repos/authRepo.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepo _authRepo;
  SignInCubit(this._authRepo) : super(SignInInitial());

  Future<void> signInUser({required String email , required password}) async {
    emit(SignInLoading());
    try {
      final user = await _authRepo.signInUserWithEmailPassword(email: email, password: password);
      emit(user.fold((user) => SignInSuccess(user), (failure) => SignInFailure(failure.message)));
    } catch (e) {
      emit(SignInFailure(e.toString()));
    }
  }
}
