import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/interview_setup/presentation/widgets/styles/custom_skill_text_field_styles.dart';

class CustomSkillTextField extends StatelessWidget {
  const CustomSkillTextField({
    required this.controller,
    required this.onSubmitted,
    super.key,
  });

  final TextEditingController controller;
  final VoidCallback onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: CustomSkillTextFieldStyles.decoration(
        hintText: 'Add your language or stack',
      ),
      onSubmitted: (_) => onSubmitted(),
    );
  }
}
