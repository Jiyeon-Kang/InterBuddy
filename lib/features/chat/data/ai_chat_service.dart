import 'dart:async';

/// Simple abstraction for AI chat service.
/// This file contains a mock implementation that simulates an AI response.
abstract class AiChatService {
  /// Sends the conversation history to the AI and returns the AI's reply text.
  /// `history` is a list of maps with keys: 'role' ('ai'|'user') and 'content'.
  Future<String> sendMessage(List<Map<String, String>> history);
}

class MockAiChatService implements AiChatService {
  const MockAiChatService();

  @override
  Future<String> sendMessage(List<Map<String, String>> history) async {
    // Simulate network latency
    await Future.delayed(const Duration(milliseconds: 900));

    // Find last user message
    final lastUser = history.reversed
        .firstWhere((m) => m['role'] == 'user', orElse: () => {'content': ''});
    final content = lastUser['content'] ?? '';

    if (content.isEmpty) {
      return 'Could you clarify your last answer a bit more?';
    }

    // Basic mock reply logic: ask a follow-up or praise and ask for details
    if (content.length < 30) {
      return 'Nice start — can you add more technical detail about the implementation?';
    }

    return 'That sounds like a solid example. What trade-offs did you consider and why did you choose that approach?';
  }
}
