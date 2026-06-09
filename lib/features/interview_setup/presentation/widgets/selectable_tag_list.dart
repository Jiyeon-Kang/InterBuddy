import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/interview_setup/presentation/widgets/selectable_tag.dart';

class SelectableTagList extends StatelessWidget {
  const SelectableTagList({
    required this.options,
    required this.selectedOptions,
    required this.onSelected,
    super.key,
  });

  final List<String> options;
  final List<String> selectedOptions;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: options.map((option) {
        return SelectableTag(
          label: option,
          isSelected: selectedOptions.contains(option),
          onSelected: () => onSelected(option),
        );
      }).toList(),
    );
  }
}
