import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_fui/domain/usecases/auth_use_cases.dart';
import 'package:todo_fui/presentation/pages/login/bloc/login_bloc.dart';

class LoginProviders extends StatelessWidget {
  const LoginProviders({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        signInWithEmailAndPasswordUseCase: context
            .read<SignInWithEmailAndPasswordUseCase>(),
        signInWithGoogleUseCase: context.read<SignInWithGoogleUseCase>(),
      ),
      child: child,
    );
  }
}
