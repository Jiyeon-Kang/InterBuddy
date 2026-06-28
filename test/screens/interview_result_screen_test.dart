import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/interview_result/presentation/pages/interview_result_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('InterviewResultScreen renders score and feedback',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: InterviewResultScreen(
          answeredQuestionCount: 5,
          totalQuestionCount: 5,
          totalAnswerLength: 500,
        ),
      ),
    );

    expect(find.text('Interview Result'), findsOneWidget);
    expect(find.text('Interview complete'), findsOneWidget);
    expect(find.text('93'), findsOneWidget);
    expect(find.text('5 / 5'), findsOneWidget);
    expect(find.text('100 chars'), findsOneWidget);
    expect(find.text('Feedback'), findsOneWidget);
    expect(find.text('Back to Setup'), findsOneWidget);
  });
}
