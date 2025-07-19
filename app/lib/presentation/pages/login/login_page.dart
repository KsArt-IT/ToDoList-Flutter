import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_fui/domain/entities/state_status.dart';
import 'package:todo_fui/presentation/pages/login/bloc/login_bloc.dart';
import 'package:todo_fui/presentation/pages/login/widgets/login_button.dart';
import 'package:todo_fui/presentation/router/app_route.dart';
import 'package:todo_fui/presentation/router/app_router.dart';
import 'package:todo_fui/presentation/widgets/field/email_input.dart';
import 'package:todo_fui/presentation/widgets/field/password_input.dart';
import 'package:todo_fui/presentation/widgets/login_with_google_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(_hasFocusEmail);
    _passwordFocusNode.addListener(_hasFocusPassword);
  }

  @override
  void dispose() {
    _emailFocusNode.removeListener(_hasFocusEmail);
    _emailFocusNode.removeListener(_hasFocusPassword);
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _hasFocusEmail() {
    if (!_emailFocusNode.hasFocus) {
      context.read<LoginBloc>().add(EmailUnfocused());
      FocusScope.of(context).requestFocus(_passwordFocusNode);
    }
  }

  void _hasFocusPassword() {
    if (!_passwordFocusNode.hasFocus) {
      context.read<LoginBloc>().add(PasswordUnfocused());
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("LoginPage::build: ok");

    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status == StateStatus.error) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage ?? 'Login failed')));
          }
          if (state.status == StateStatus.success) {
            context.go(AppRouter.initialLocation, extra: state.user);
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Login Page', textAlign: TextAlign.center),
                const SizedBox(height: 8),
                Image.asset('assets/images/loginLogo.png', width: 100, height: 100),
                const SizedBox(height: 8),
                EmailInput(
                  focusNode: _emailFocusNode,
                  onChanged: (value) => context.read<LoginBloc>().add(EmailChanged(email: value)),
                ),
                const SizedBox(height: 8),
                PasswordInput(
                  focusNode: _passwordFocusNode,
                  onChanged: (value) =>
                      context.read<LoginBloc>().add(PasswordChanged(password: value)),
                ),
                const SizedBox(height: 16),
                LoginButton(),
                if (context.read<GoogleSignIn>().supportsAuthenticate()) ...[
                  const SizedBox(height: 8),
                  LoginWithGoogleButton(
                    onPressed: () => context.read<LoginBloc>().add(LoginWithGoogleRequested()),
                  ),
                  // ] else if (kIsWeb) ...[
                  //   const SizedBox(height: 8),
                  //   web.renderButton(),
                ],
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => context.push(AppRoute.resetPassword.path),
                      child: const Text('Forgot Password?'),
                    ),
                    const SizedBox(width: 16),
                    TextButton(
                      onPressed: () => context.push(AppRoute.registration.path),
                      child: const Text('Registration'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
