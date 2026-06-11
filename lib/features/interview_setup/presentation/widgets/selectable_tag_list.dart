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

  static const double _spacing = 10;
  static const double _runSpacing = 10;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: _spacing,
      runSpacing: _runSpacing,
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
