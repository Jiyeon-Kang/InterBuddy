import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/chat/presentation/pages/chat_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ChatScreen basic UI rendering test',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ChatScreen(),
      ),
    );

    expect(find.text('InterBuddy - AI Interviewer'), findsOneWidget);
    expect(find.text('AI Interviewer conversation will be displayed here.'),
        findsOneWidget);
    expect(find.text('Type your answer here...'), findsOneWidget);
    expect(find.byIcon(Icons.send), findsOneWidget);
  });
}
