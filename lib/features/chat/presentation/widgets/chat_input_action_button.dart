import 'package:flutter/material.dart';

class ChatInputActionButton extends StatelessWidget {
  const ChatInputActionButton({
    required this.onPressed,
    super.key,
  });

  static const Color _iconColor = Colors.blueAccent;
  static const EdgeInsets _padding = EdgeInsets.all(8.0);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.send),
      color: _iconColor,
      padding: _padding,
      onPressed: onPressed,
    );
  }
}
