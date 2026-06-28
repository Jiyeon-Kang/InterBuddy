import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/chat/presentation/pages/chat_screen.dart';
import 'package:flutter_application_1/features/interview_result/presentation/pages/interview_result_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ChatScreen renders initial question and sends user answer',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ChatScreen(),
      ),
    );

    expect(find.text('InterBuddy - AI Interviewer'), findsOneWidget);
    expect(
      find.text(
        'Tell me about a project where you solved a difficult technical problem.',
      ),
      findsOneWidget,
    );
    expect(find.text('Type your answer here...'), findsOneWidget);
    expect(find.byIcon(Icons.send), findsOneWidget);

    await tester.enterText(
      find.byType(TextField),
      'I improved API latency by adding caching.',
    );
    await tester.tap(find.byIcon(Icons.send));
    await tester.pump();

    expect(
      find.text('I improved API latency by adding caching.'),
      findsOneWidget,
    );

    await tester.pump(const Duration(milliseconds: 900));
    await tester.pump();

    expect(
      find.text(
        'That sounds like a solid example. What trade-offs did you consider and why did you choose that approach?',
      ),
      findsOneWidget,
    );
  });

  testWidgets('ChatScreen shows result after final answer',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ChatScreen(questionCount: 1),
      ),
    );

    await tester.enterText(
      find.byType(TextField),
      'I improved API latency by adding caching.',
    );
    await tester.tap(find.byIcon(Icons.send));
    await tester.pumpAndSettle();

    expect(find.byType(InterviewResultScreen), findsOneWidget);
    expect(find.text('Interview complete'), findsOneWidget);
    expect(find.text('1 / 1'), findsOneWidget);
  });
}
