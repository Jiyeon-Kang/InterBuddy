import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/interview_setup/presentation/widgets/styles/add_skill_button_styles.dart';

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
      style: AddSkillButtonStyles.style(),
      icon: const Icon(Icons.add),
      tooltip: 'Add skill',
    );
  }
}
