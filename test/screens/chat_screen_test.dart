import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/chat/presentation/pages/chat_screen.dart';
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
  });
}
