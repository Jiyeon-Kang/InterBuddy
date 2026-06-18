import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/chat/presentation/widgets/ai_question_message.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AiQuestionMessage renders AI question text',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AiQuestionMessage(
            message: 'What is your strongest backend project?',
          ),
        ),
      ),
    );

    expect(
      find.text('What is your strongest backend project?'),
      findsOneWidget,
    );
  });
}
