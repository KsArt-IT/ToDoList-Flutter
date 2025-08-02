import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_fui/domain/usecases/auth_use_cases.dart';
import 'package:todo_fui/presentation/pages/reset_password/cubit/reset_password_cubit.dart';

class ResetPasswordProviders extends StatelessWidget {
  const ResetPasswordProviders({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(
        sendPasswordResetEmailUseCase: context.read<SendPasswordResetEmailUseCase>(),
      ),
      child: child,
    );
  }
}
