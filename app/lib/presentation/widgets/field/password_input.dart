import 'package:flutter/material.dart';
import 'package:todo_fui/domain/entities/password.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({this.focusNode, this.onChanged, super.key});

  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  var _obscure = true;

  void _toggle() {
    setState(() {
      _obscure = !_obscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return TextFormField(
      focusNode: widget.focusNode,
      onChanged: widget.onChanged,
      textInputAction: TextInputAction.done,
      obscureText: _obscure,
      autocorrect: false,
      autovalidateMode: AutovalidateMode.always,
      validator: (value) {
        if (value == null || value.isEmpty) return null;
        return Password.validate(value)
            ? null
            : '''Password must be at least 8 characters and contain at least one letter and number''';
      },
      decoration: InputDecoration(
        icon: const Icon(Icons.lock),
        suffixIcon: GestureDetector(
          onTap: _toggle,
          behavior: HitTestBehavior.translucent,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Icon(_obscure ? Icons.remove_red_eye_outlined : Icons.emergency),
          ),
        ),
        filled: true,
        helperText:
            '''Password should be at least 8 characters with at least one letter and number''',
        helperMaxLines: 2,
        labelText: 'Password',
        errorMaxLines: 2,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: colors.outlineVariant, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: colors.outline, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: colors.error, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: colors.error, width: 2.0),
        ),
      ),
    );
  }
}
