import 'package:flutter/material.dart';

class ChatAnswerTextField extends StatelessWidget {
  const ChatAnswerTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Type your answer here...',
        border: OutlineInputBorder(),
      ),
    );
  }
}
