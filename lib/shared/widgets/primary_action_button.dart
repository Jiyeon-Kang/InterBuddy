import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/widgets/styles/primary_action_button_styles.dart';

class PrimaryActionButton extends StatelessWidget {
  const PrimaryActionButton({
    required this.label,
    required this.onPressed,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: PrimaryActionButtonStyles.buttonStyle(),
      child: Text(
        label,
        style: PrimaryActionButtonStyles.labelTextStyle,
      ),
    );
  }
}
