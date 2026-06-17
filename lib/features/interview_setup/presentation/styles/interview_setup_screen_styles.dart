import 'package:flutter/material.dart';

class InterviewSetupScreenStyles {
  const InterviewSetupScreenStyles._();

  static const Color primaryColor = Colors.blueAccent;
  static const Color screenBackgroundColor = Colors.white;
  static const Color textColor = Colors.black87;
  static const Color selectedTextColor = Colors.white;
  static const Color subtitleColor = Colors.grey;

  static const double borderRadius = 12;
  static const double headerIconSize = 72;

  static const EdgeInsets pagePadding = EdgeInsets.all(24.0);
  static const EdgeInsets dropdownPadding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 14,
  );
  static const SizedBox headerIconTitleGap = SizedBox(height: 20);
  static const SizedBox titleSubtitleGap = SizedBox(height: 8);
  static const SizedBox headerSectionGap = SizedBox(height: 32);
  static const SizedBox sectionTitleContentGap = SizedBox(height: 12);
  static const SizedBox sectionGap = SizedBox(height: 28);
  static const SizedBox bottomButtonGap = SizedBox(height: 36);

  static const TextStyle titleTextStyle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: textColor,
  );

  static const TextStyle subtitleTextStyle = TextStyle(
    fontSize: 16,
    color: subtitleColor,
    height: 1.4,
  );

  static const TextStyle sectionTitleTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: textColor,
  );

  static BorderRadius get roundedBorderRadius {
    return BorderRadius.circular(borderRadius);
  }

  static OutlineInputBorder inputBorder() {
    return OutlineInputBorder(
      borderRadius: roundedBorderRadius,
    );
  }

  static InputDecoration dropdownDecoration() {
    return InputDecoration(
      border: inputBorder(),
      contentPadding: dropdownPadding,
    );
  }
}
