import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/interview_setup/presentation/widgets/add_skill_button.dart';
import 'package:flutter_application_1/features/interview_setup/presentation/widgets/custom_skill_text_field.dart';
import 'package:flutter_application_1/features/interview_setup/presentation/widgets/selectable_tag_list.dart';
import 'package:flutter_application_1/features/interview_setup/presentation/widgets/styles/skill_selection_section_styles.dart';

class SkillSelectionSection extends StatelessWidget {
  const SkillSelectionSection({
    required this.isEnabled,
    required this.options,
    required this.selectedSkills,
    required this.controller,
    required this.onSkillSelected,
    required this.onSkillAdded,
    super.key,
  });

  final bool isEnabled;
  final List<String> options;
  final List<String> selectedSkills;
  final TextEditingController controller;
  final ValueChanged<String> onSkillSelected;
  final VoidCallback onSkillAdded;

  @override
  Widget build(BuildContext context) {
    if (!isEnabled) {
      return Container(
        padding: SkillSelectionSectionStyles.disabledFieldPadding,
        decoration: SkillSelectionSectionStyles.disabledFieldDecoration(),
        child: Text(
          'Choose a field first',
          style: SkillSelectionSectionStyles.disabledFieldTextStyle(),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SelectableTagList(
          options: options,
          selectedOptions: selectedSkills,
          onSelected: onSkillSelected,
        ),
        SkillSelectionSectionStyles.inputGap,
        Row(
          children: [
            Expanded(
              child: CustomSkillTextField(
                controller: controller,
                onSubmitted: onSkillAdded,
              ),
            ),
            SkillSelectionSectionStyles.addButtonGap,
            AddSkillButton(onPressed: onSkillAdded),
          ],
        ),
      ],
    );
  }
}
