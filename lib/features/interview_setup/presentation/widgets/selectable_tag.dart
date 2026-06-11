import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/interview_setup/presentation/widgets/styles/selectable_tag_styles.dart';

class SelectableTag extends StatelessWidget {
  const SelectableTag({
    required this.label,
    required this.isSelected,
    required this.onSelected,
    super.key,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: SelectableTagStyles.theme(context),
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        selectedColor: SelectableTagStyles.primaryColor,
        pressElevation: 0,
        showCheckmark: true,
        labelStyle: SelectableTagStyles.textStyle(
          isSelected: isSelected,
        ),
        backgroundColor: SelectableTagStyles.backgroundColor(),
        side: SelectableTagStyles.borderSide(isSelected: isSelected),
        onSelected: (_) => onSelected(),
      ),
    );
  }
}
