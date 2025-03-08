import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/errors/get_it.dart';
import '../../cubits/cubit/sign_up_cubit.dart';
import '../../Data/repos/authRepo.dart';
import '../widgets/SignUpViewBodyBlocConsumer.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(getIt<AuthRepo>()),
      child: const Scaffold(
        body: SignUpViewBodyBlocConsumer(),
      ),
    );
  }
}

