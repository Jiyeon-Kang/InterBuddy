import 'package:flutter/material.dart';

class SkillSelectionSectionStyles {
  const SkillSelectionSectionStyles._();

  static const double borderRadius = 12;
  static const double addButtonSpacing = 8;

  static const EdgeInsets disabledFieldPadding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 14,
  );

  static const SizedBox inputGap = SizedBox(height: 12);
  static const SizedBox addButtonGap = SizedBox(width: addButtonSpacing);

  static BorderRadius get roundedBorderRadius {
    return BorderRadius.circular(borderRadius);
  }

  static BoxDecoration disabledFieldDecoration() {
    return BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: roundedBorderRadius,
      border: Border.all(color: Colors.grey.shade300),
    );
  }

  static TextStyle disabledFieldTextStyle() {
    return TextStyle(color: Colors.grey.shade600);
  }
}
