import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_fui/presentation/localization/localization_context_ext.dart';
import 'package:todo_fui/presentation/pages/reset_password/cubit/reset_password_cubit.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isValid = context.select((ResetPasswordCubit bloc) => bloc.state.isValid);
    return ElevatedButton(
      onPressed: isValid ? () => context.read<ResetPasswordCubit>().resetPassword() : null,
      child: Text(context.l10n.resetPassword),
    );
  }
}
