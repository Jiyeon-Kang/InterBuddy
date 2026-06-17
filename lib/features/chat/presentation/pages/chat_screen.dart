import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/chat/presentation/styles/chat_screen_styles.dart';
import 'package:flutter_application_1/features/chat/presentation/widgets/chat_answer_text_field.dart';
import 'package:flutter_application_1/features/chat/presentation/widgets/chat_input_action_button.dart';
import 'package:flutter_application_1/shared/widgets/app_header.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppHeader(title: 'InterBuddy - AI Interviewer'),
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              child: Center(
                child: Text(
                  'AI Interviewer conversation will be displayed here.',
                  style: ChatScreenStyles.placeholderTextStyle,
                ),
              ),
            ),
            Padding(
              padding: ChatScreenStyles.inputAreaPadding,
              child: Row(
                children: [
                  const Expanded(
                    child: ChatAnswerTextField(),
                  ),
                  ChatScreenStyles.inputActionGap,
                  ChatInputActionButton(
                    onPressed: () {
                      // TODO: Handle sending message
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
