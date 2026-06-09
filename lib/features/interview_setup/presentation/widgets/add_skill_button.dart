import 'package:flutter/material.dart';

class AddSkillButton extends StatelessWidget {
  const AddSkillButton({
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: onPressed,
      icon: const Icon(Icons.add),
      tooltip: 'Add language',
    );
  }
}
