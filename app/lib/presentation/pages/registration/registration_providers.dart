import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_fui/domain/usecases/auth_use_cases.dart';
import 'package:todo_fui/presentation/pages/registration/bloc/registration_bloc.dart';

class RegistrationProviders extends StatelessWidget {
  const RegistrationProviders({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationBloc(
        signUpWithEmailAndPasswordUseCase: context.read<SignUpWithEmailAndPasswordUseCase>(),
        signOutUseCase: context.read<SignOutUseCase>(),
      ),
      child: child,
    );
  }
}
