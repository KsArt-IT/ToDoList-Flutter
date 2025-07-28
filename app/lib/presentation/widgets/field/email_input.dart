import 'package:flutter/material.dart';
import 'package:todo_fui/domain/entities/email.dart';
import 'package:todo_fui/presentation/localization/localization_context_ext.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({this.focusNode, this.onChanged, super.key});

  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return TextFormField(
      focusNode: focusNode,
      onChanged: onChanged,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      autocorrect: false,
      autovalidateMode: AutovalidateMode.always,
      validator: (value) {
        if (value == null || value.isEmpty) return null;
        return Email.validate(value) ? null : context.l10n.emailNotValid;
      },
      decoration: InputDecoration(
        icon: const Icon(Icons.email),
        labelText: context.l10n.emailInput,
        helperText: context.l10n.emailInputHelperText,
        filled: true,
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
