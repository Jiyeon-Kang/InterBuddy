import 'package:flutter/material.dart';

class PrimaryActionButtonStyles {
  const PrimaryActionButtonStyles._();

  static const Color backgroundColor = Colors.blueAccent;
  static const Color foregroundColor = Colors.white;
  static const double borderRadius = 12;

  static const EdgeInsets padding = EdgeInsets.symmetric(vertical: 16);

  static const TextStyle labelTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static BorderRadius get roundedBorderRadius {
    return BorderRadius.circular(borderRadius);
  }

  static ButtonStyle buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      padding: padding,
      shape: RoundedRectangleBorder(
        borderRadius: roundedBorderRadius,
      ),
      elevation: 0,
    ).copyWith(
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      splashFactory: NoSplash.splashFactory,
    );
  }
}
