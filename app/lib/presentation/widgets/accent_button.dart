import 'package:flutter/material.dart';

class AccentButton extends StatelessWidget {
  final String label;
  final bool isEnabled;
  final double height;
  final double borderRadius;

  final VoidCallback onPressed;

  const AccentButton({
    required this.label,
    required this.isEnabled,
    required this.onPressed,
    this.height = 52,
    this.borderRadius = 16,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        ),
        child: Text(label),
      ),
    );
  }
}
