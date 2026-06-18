import 'package:flutter/material.dart';

class ChatAnswerTextField extends StatelessWidget {
  const ChatAnswerTextField({
    required this.controller,
    required this.onSubmitted,
    super.key,
  });

  final TextEditingController controller;
  final ValueChanged<String> onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textInputAction: TextInputAction.send,
      onSubmitted: onSubmitted,
      decoration: const InputDecoration(
        hintText: 'Type your answer here...',
        border: OutlineInputBorder(),
      ),
    );
  }
}
