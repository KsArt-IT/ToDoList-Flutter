import 'package:flutter/material.dart';

class LoginWithGoogleButton extends StatelessWidget {
  const LoginWithGoogleButton({this.onPressed, super.key});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Image.asset('assets/images/google.png', width: 28, height: 28),
      label: const Text('Login with Google'),
    );
  }
}
