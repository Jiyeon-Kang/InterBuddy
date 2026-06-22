import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/chat/presentation/widgets/chat_message_bubble.dart';

class UserAnswerMessage extends StatelessWidget {
  const UserAnswerMessage({
    required this.message,
    super.key,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return ChatMessageBubble(
      message: message,
      alignment: Alignment.centerRight,
      backgroundColor: Colors.blueAccent,
      textColor: Colors.white,
    );
  }
}
