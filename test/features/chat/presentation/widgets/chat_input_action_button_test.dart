import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/chat/presentation/widgets/chat_input_action_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ChatInputActionButton handles tap', (WidgetTester tester) async {
    bool wasPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ChatInputActionButton(
            onPressed: () {
              wasPressed = true;
            },
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.send), findsOneWidget);

    await tester.tap(find.byIcon(Icons.send));
    await tester.pump();

    expect(wasPressed, isTrue);
  });
}
