import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/chat/data/ai_chat_service.dart';
import 'package:flutter_application_1/features/chat/presentation/styles/chat_screen_styles.dart';
import 'package:flutter_application_1/features/chat/presentation/widgets/ai_question_message.dart';
import 'package:flutter_application_1/features/chat/presentation/widgets/chat_answer_text_field.dart';
import 'package:flutter_application_1/features/chat/presentation/widgets/chat_input_action_button.dart';
import 'package:flutter_application_1/features/chat/presentation/widgets/chat_loading_indicator.dart';
import 'package:flutter_application_1/features/chat/presentation/widgets/user_answer_message.dart';
import 'package:flutter_application_1/shared/widgets/app_header.dart';

enum _ChatMessageRole { ai, user }

class _ChatMessage {
  const _ChatMessage({
    required this.role,
    required this.message,
  });

  final _ChatMessageRole role;
  final String message;
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _answerController = TextEditingController();
  final List<_ChatMessage> _messages = const [
    _ChatMessage(
      role: _ChatMessageRole.ai,
      message:
          'Tell me about a project where you solved a difficult technical problem.',
    ),
  ].toList();
  bool _isWaitingForAi = false;
  final AiChatService _aiService = const MockAiChatService();

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }

  void _sendAnswer() {
    final String answer = _answerController.text.trim();

    if (answer.isEmpty || _isWaitingForAi) {
      return;
    }

    setState(() {
      _messages.add(
        _ChatMessage(
          role: _ChatMessageRole.user,
          message: answer,
        ),
      );
      _answerController.clear();
      _isWaitingForAi = true;
    });

    // Prepare a minimal history format for the AI service and await reply
    final history = _messages
        .map((m) => {
              'role': m.role == _ChatMessageRole.user ? 'user' : 'ai',
              'content': m.message,
            })
        .toList();

    _aiService.sendMessage(history).then((reply) {
      setState(() {
        _messages.add(
          _ChatMessage(role: _ChatMessageRole.ai, message: reply),
        );
        _isWaitingForAi = false;
      });
    }).catchError((error) {
      setState(() {
        _messages.add(
          _ChatMessage(role: _ChatMessageRole.ai, message: 'Error: $error'),
        );
        _isWaitingForAi = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppHeader(title: 'InterBuddy - AI Interviewer'),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: ChatScreenStyles.conversationPadding,
                itemCount: _messages.length + (_isWaitingForAi ? 1 : 0),
                separatorBuilder: (context, index) {
                  return ChatScreenStyles.messageGap;
                },
                itemBuilder: (context, index) {
                  if (_isWaitingForAi && index == _messages.length) {
                    return const ChatLoadingIndicator();
                  }

                  final _ChatMessage message = _messages[index];

                  return switch (message.role) {
                    _ChatMessageRole.ai => AiQuestionMessage(
                        message: message.message,
                      ),
                    _ChatMessageRole.user => UserAnswerMessage(
                        message: message.message,
                      ),
                  };
                },
              ),
            ),
            Padding(
              padding: ChatScreenStyles.inputAreaPadding,
              child: Row(
                children: [
                  Expanded(
                    child: ChatAnswerTextField(
                      controller: _answerController,
                      onSubmitted: (_) => _sendAnswer(),
                    ),
                  ),
                  ChatScreenStyles.inputActionGap,
                  ChatInputActionButton(
                    onPressed: _sendAnswer,
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
