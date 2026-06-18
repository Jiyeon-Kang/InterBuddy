import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/chat/presentation/widgets/chat_message_bubble.dart';

class AiQuestionMessage extends StatelessWidget {
  const AiQuestionMessage({
    required this.message,
    super.key,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return ChatMessageBubble(
      message: message,
      alignment: Alignment.centerLeft,
      backgroundColor: Colors.blueGrey.shade700,
      textColor: Colors.white,
    );
  }
}
