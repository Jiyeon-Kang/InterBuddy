import 'package:flutter/material.dart';

class InterviewResultScreenStyles {
  const InterviewResultScreenStyles._();

  static const Color primaryColor = Colors.blueAccent;
  static const Color screenBackgroundColor = Colors.white;
  static const Color textColor = Colors.black87;
  static const Color mutedTextColor = Colors.grey;
  static const Color successColor = Color(0xFF2E7D32);
  static const Color warningColor = Color(0xFFF57C00);
  static const Color panelBackgroundColor = Color(0xFFF7F9FC);
  static const Color panelBorderColor = Color(0xFFE5EAF2);

  static const double headerIconSize = 72;
  static const double scoreCircleSize = 132;
  static const double panelBorderRadius = 8;

  static const EdgeInsets pagePadding = EdgeInsets.all(24.0);
  static const EdgeInsets scorePanelPadding = EdgeInsets.all(24.0);
  static const EdgeInsets metricPanelPadding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 14,
  );
  static const EdgeInsets feedbackPadding = EdgeInsets.all(18.0);

  static const SizedBox headerIconTitleGap = SizedBox(height: 20);
  static const SizedBox titleSubtitleGap = SizedBox(height: 8);
  static const SizedBox headerSectionGap = SizedBox(height: 28);
  static const SizedBox sectionGap = SizedBox(height: 18);
  static const SizedBox compactGap = SizedBox(height: 10);
  static const SizedBox metricGap = SizedBox(width: 10);
  static const SizedBox bottomButtonGap = SizedBox(height: 28);

  static const TextStyle titleTextStyle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: textColor,
  );

  static const TextStyle subtitleTextStyle = TextStyle(
    fontSize: 16,
    color: mutedTextColor,
    height: 1.4,
  );

  static const TextStyle scoreTextStyle = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: primaryColor,
  );

  static const TextStyle scoreLabelTextStyle = TextStyle(
    fontSize: 14,
    color: mutedTextColor,
  );

  static const TextStyle metricValueTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: textColor,
  );

  static const TextStyle metricLabelTextStyle = TextStyle(
    fontSize: 13,
    color: mutedTextColor,
  );

  static const TextStyle sectionTitleTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: textColor,
  );

  static const TextStyle feedbackTextStyle = TextStyle(
    fontSize: 15,
    height: 1.5,
    color: textColor,
  );

  static BoxDecoration panelDecoration() {
    return BoxDecoration(
      color: panelBackgroundColor,
      borderRadius: BorderRadius.circular(panelBorderRadius),
      border: Border.all(color: panelBorderColor),
    );
  }

  static BoxDecoration scoreCircleDecoration() {
    return BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white,
      border: Border.all(
        color: primaryColor.withOpacity(0.18),
        width: 8,
      ),
    );
  }
}
