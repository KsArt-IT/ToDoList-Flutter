import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_fui/core/extension/context_ext.dart';
import 'package:todo_fui/domain/entities/state_status.dart';
import 'package:todo_fui/presentation/localization/localization_context_ext.dart';
import 'package:todo_fui/presentation/pages/registration/bloc/registration_bloc.dart';
import 'package:todo_fui/presentation/router/app_router.dart';
import 'package:todo_fui/presentation/widgets/accent_button.dart';
import 'package:todo_fui/presentation/widgets/field/email_input.dart';
import 'package:todo_fui/presentation/widgets/field/password_input.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("RegistrationPage::build: ok");

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.registration),
        centerTitle: true,
      ),
      body: BlocListener<RegistrationBloc, RegistrationState>(
        listener: (context, state) async {
          if (state.status == StateStatus.error) {
            context.showSnackBar(state.errorMessage ?? context.l10n.error);
          }
          if (state.status == StateStatus.success) {
            context.go(AppRouter.initialLocation);
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
                EmailInput(
                  onChanged: (value) =>
                      context.read<RegistrationBloc>().add(EmailChanged(email: value)),
                ),
                const SizedBox(height: 8),
                PasswordInput(
                  textInputAction: TextInputAction.done,
                  onChanged: (value) =>
                      context.read<RegistrationBloc>().add(PasswordChanged(password: value)),
                ),
                const SizedBox(height: 8),
                BlocBuilder<RegistrationBloc, RegistrationState>(
                  buildWhen: (previous, current) => previous.password != current.password,
                  builder: (context, state) {
                    return PasswordInput(
                      labelText: context.l10n.passwordConfirm,
                      helperText: '',
                      validator: (value) {
                        return (value == null || value.isEmpty || value == state.password.value)
                            ? null
                            : '';
                      },
                      onChanged: (value) => context.read<RegistrationBloc>().add(
                        PasswordConfirmChanged(password: value),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                BlocBuilder<RegistrationBloc, RegistrationState>(
                  buildWhen: (previous, current) => previous.isValid != current.isValid,
                  builder: (context, state) {
                    return AccentButton(
                      label: context.l10n.register,
                      isEnabled: state.isValid,
                      onPressed: () => context.read<RegistrationBloc>().add(RegistrationRequest()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
