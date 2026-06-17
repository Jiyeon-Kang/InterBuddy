import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/welcome/presentation/pages/welcome_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('WelcomeScreen rendering and navigation test',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: WelcomeScreen(),
      ),
    );

    expect(find.byIcon(Icons.psychology), findsOneWidget);
    expect(find.text('InterBuddy'), findsOneWidget);
    expect(
      find.text(
          'Practice realistic interviews with AI\nand achieve your dreams.'),
      findsOneWidget,
    );
    expect(find.text('Start Interview Practice'), findsOneWidget);

    await tester.tap(find.text('Start Interview Practice'));
    await tester.pumpAndSettle();
  });
}
