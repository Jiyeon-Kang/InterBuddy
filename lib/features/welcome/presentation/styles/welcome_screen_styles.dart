import 'package:flutter/material.dart';

class WelcomeScreenStyles {
  const WelcomeScreenStyles._();

  static const Color screenBackgroundColor = Colors.white;
  static const Color primaryColor = Colors.blueAccent;
  static const Color titleColor = Colors.black87;
  static const Color subtitleColor = Colors.grey;

  static const double logoIconSize = 100;

  static const EdgeInsets pagePadding = EdgeInsets.symmetric(horizontal: 24.0);

  static const SizedBox logoTitleGap = SizedBox(height: 24);
  static const SizedBox titleSubtitleGap = SizedBox(height: 12);
  static const SizedBox bottomGap = SizedBox(height: 24);

  static const TextStyle titleTextStyle = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: titleColor,
  );

  static const TextStyle subtitleTextStyle = TextStyle(
    fontSize: 16,
    color: subtitleColor,
    height: 1.5,
  );
}
