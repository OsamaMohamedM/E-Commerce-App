import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../Core/errors/get_it.dart';
import '../../cubits/cubit/sign_up_cubit.dart';
import '../../domain/repos/authRepo.dart';
import '../widgets/SignUpViewBody.dart';

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

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        if(state is SignUpSuccess){
           GoRouter.of(context).pop();
        }
        if(state is SignUpFailure){
          ScaffoldMessenger.of(context).showSnackBar(
            
            SnackBar(content: Text(state.message)
            ));
        }
        return  ModalProgressHUD(
          inAsyncCall: state is SignUpLoading,
          child: const SignUpViewBody(),
        );
      },
    );
  }
}
