import 'package:flutter/material.dart';

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
      data: Theme.of(context).copyWith(
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        selectedColor: Colors.blueAccent,
        pressElevation: 0,
        showCheckmark: true,
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : Colors.black87,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
        backgroundColor: Colors.grey.shade100,
        side: BorderSide(
          color: isSelected ? Colors.blueAccent : Colors.grey.shade300,
        ),
        onSelected: (_) => onSelected(),
      ),
    );
  }
}
