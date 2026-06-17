import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/widgets/primary_action_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('PrimaryActionButton renders label and handles tap',
      (WidgetTester tester) async {
    bool wasPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PrimaryActionButton(
            label: 'Continue',
            onPressed: () {
              wasPressed = true;
            },
          ),
        ),
      ),
    );

    expect(find.text('Continue'), findsOneWidget);

    await tester.tap(find.text('Continue'));
    await tester.pump();

    expect(wasPressed, isTrue);
  });
}
