import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_fui/core/extension/context_ext.dart';
import 'package:todo_fui/domain/entities/state_status.dart';
import 'package:todo_fui/presentation/localization/localization_context_ext.dart';
import 'package:todo_fui/presentation/pages/reset_password/cubit/reset_password_cubit.dart';
import 'package:todo_fui/presentation/pages/reset_password/widgets/reset_password_button.dart';
import 'package:todo_fui/presentation/widgets/field/email_input.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("ResetPasswordPage::build: ok");

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.resetPasswordPage), centerTitle: true),
      body: BlocListener<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          if (state.status == StateStatus.error) {
            context.showSnackBar(state.errorMessage ?? context.l10n.error);
          }
          if (state.status == StateStatus.success) {
            context.pop();
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/images/loginLogo.png', width: 100, height: 100),
                const SizedBox(height: 8),
                EmailInput(onChanged: context.read<ResetPasswordCubit>().onEmailChanged),
                const SizedBox(height: 16),
                ResetPasswordButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
