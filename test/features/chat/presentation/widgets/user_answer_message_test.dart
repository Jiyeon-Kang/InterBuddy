import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/chat/presentation/widgets/user_answer_message.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('UserAnswerMessage renders user answer text',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: UserAnswerMessage(
            message: 'I built an interview practice app.',
          ),
        ),
      ),
    );

    expect(
      find.text('I built an interview practice app.'),
      findsOneWidget,
    );
  });
}
