import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/interview_setup/presentation/widgets/custom_skill_text_field.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CustomSkillTextField renders hint and submits',
      (WidgetTester tester) async {
    bool wasSubmitted = false;
    final TextEditingController controller = TextEditingController();

    addTearDown(controller.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomSkillTextField(
            controller: controller,
            onSubmitted: () {
              wasSubmitted = true;
            },
          ),
        ),
      ),
    );

    expect(find.text('Add your skill or stack'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'GraphQL');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    expect(controller.text, 'GraphQL');
    expect(wasSubmitted, isTrue);
  });
}
