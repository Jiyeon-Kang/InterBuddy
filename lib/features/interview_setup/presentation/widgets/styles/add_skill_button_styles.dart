import 'package:flutter/material.dart';

class AddSkillButtonStyles {
  const AddSkillButtonStyles._();

  static const Color primaryColor = Colors.blueAccent;
  static const Color foregroundColor = Colors.white;

  static ButtonStyle style() {
    return IconButton.styleFrom(
      backgroundColor: primaryColor,
      foregroundColor: foregroundColor,
    );
  }
}
