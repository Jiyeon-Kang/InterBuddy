import 'package:flutter/material.dart';

class SelectableTagStyles {
  const SelectableTagStyles._();

  static const Color primaryColor = Colors.blueAccent;
  static const Color textColor = Colors.black87;
  static const Color selectedTextColor = Colors.white;

  static ThemeData theme(BuildContext context) {
    return Theme.of(context).copyWith(
      splashFactory: NoSplash.splashFactory,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }

  static TextStyle textStyle({required bool isSelected}) {
    return TextStyle(
      color: isSelected ? selectedTextColor : textColor,
      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
    );
  }

  static BorderSide borderSide({required bool isSelected}) {
    return BorderSide(
      color: isSelected ? primaryColor : Colors.grey.shade300,
    );
  }

  static Color backgroundColor() {
    return Colors.grey.shade100;
  }
}
