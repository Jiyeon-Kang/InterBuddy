import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/chat/presentation/widgets/chat_answer_text_field.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ChatAnswerTextField renders hint and accepts input',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ChatAnswerTextField(),
        ),
      ),
    );

    expect(find.text('Type your answer here...'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'My answer');
    await tester.pump();

    expect(find.text('My answer'), findsOneWidget);
  });
}
