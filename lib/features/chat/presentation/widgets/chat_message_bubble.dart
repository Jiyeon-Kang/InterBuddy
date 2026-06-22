import 'package:flutter/material.dart';

class ChatMessageBubble extends StatelessWidget {
  const ChatMessageBubble({
    required this.message,
    required this.alignment,
    required this.backgroundColor,
    required this.textColor,
    super.key,
  });

  final String message;
  final Alignment alignment;
  final Color backgroundColor;
  final Color textColor;

  static const double _maxWidthFactor = 0.78;
  static const double _borderRadius = 16;
  static const EdgeInsets _padding = EdgeInsets.symmetric(
    horizontal: 14,
    vertical: 12,
  );
  static const TextStyle _textStyle = TextStyle(
    fontSize: 15,
    height: 1.4,
  );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: FractionallySizedBox(
        widthFactor: _maxWidthFactor,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(_borderRadius),
          ),
          child: Padding(
            padding: _padding,
            child: Text(
              message,
              style: _textStyle.copyWith(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
