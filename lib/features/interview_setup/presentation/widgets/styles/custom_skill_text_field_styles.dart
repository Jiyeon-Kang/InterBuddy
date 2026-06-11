import 'package:flutter/material.dart';

class CustomSkillTextFieldStyles {
  const CustomSkillTextFieldStyles._();

  static const double borderRadius = 12;

  static const EdgeInsets contentPadding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 14,
  );

  static BorderRadius get roundedBorderRadius {
    return BorderRadius.circular(borderRadius);
  }

  static OutlineInputBorder border() {
    return OutlineInputBorder(
      borderRadius: roundedBorderRadius,
    );
  }

  static InputDecoration decoration({required String hintText}) {
    return InputDecoration(
      hintText: hintText,
      border: border(),
      contentPadding: contentPadding,
    );
  }
}
