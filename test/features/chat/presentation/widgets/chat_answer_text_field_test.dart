import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/chat/presentation/widgets/chat_answer_text_field.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ChatAnswerTextField renders hint, accepts input, and submits',
      (WidgetTester tester) async {
    String? submittedAnswer;
    final TextEditingController controller = TextEditingController();

    addTearDown(controller.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ChatAnswerTextField(
            controller: controller,
            onSubmitted: (value) {
              submittedAnswer = value;
            },
          ),
        ),
      ),
    );

    expect(find.text('Type your answer here...'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'My answer');
    await tester.pump();

    expect(find.text('My answer'), findsOneWidget);

    await tester.testTextInput.receiveAction(TextInputAction.send);
    await tester.pump();

    expect(submittedAnswer, 'My answer');
  });
}
