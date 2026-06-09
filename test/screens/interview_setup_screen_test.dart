import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/ChatScreen.dart';
import 'package:flutter_application_1/screens/InterviewSetupScreen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('InterviewSetupScreen renders setup options and navigates',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: InterviewSetupScreen(),
      ),
    );

    expect(find.text('Interview Setup'), findsOneWidget);
    expect(find.text('Customize your interview'), findsOneWidget);
    expect(find.text('Field'), findsOneWidget);
    expect(find.text('Frontend'), findsOneWidget);
    expect(find.text('Backend'), findsOneWidget);
    expect(find.text('Choose a field first'), findsOneWidget);
    expect(find.text('Experience Level'), findsOneWidget);
    expect(find.text('Junior'), findsOneWidget);
    expect(find.text('Interview Type'), findsOneWidget);
    expect(find.text('Technical'), findsOneWidget);
    expect(find.text('5 questions'), findsOneWidget);
    expect(find.text('Start Interview'), findsOneWidget);

    await tester.tap(find.text('Backend'));
    await tester.pumpAndSettle();

    expect(find.text('Java'), findsOneWidget);
    expect(find.text('Spring Boot'), findsOneWidget);
    expect(find.text('Add your language or stack'), findsOneWidget);

    await tester.ensureVisible(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    await tester.enterText(
      find.byType(TextField),
      'GraphQL',
    );
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    expect(find.text('GraphQL'), findsOneWidget);

    await tester.ensureVisible(find.text('Start Interview'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Start Interview'));
    await tester.pumpAndSettle();

    expect(find.byType(ChatScreen), findsOneWidget);
  });
}
