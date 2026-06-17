import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/interview_setup/presentation/widgets/skill_selection_section.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SkillSelectionSection renders disabled message',
      (WidgetTester tester) async {
    final TextEditingController controller = TextEditingController();

    addTearDown(controller.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SkillSelectionSection(
            isEnabled: false,
            options: const [],
            selectedSkills: const [],
            controller: controller,
            onSkillSelected: (_) {},
            onSkillAdded: () {},
          ),
        ),
      ),
    );

    expect(find.text('Choose a field first'), findsOneWidget);
    expect(find.byType(TextField), findsNothing);
  });

  testWidgets('SkillSelectionSection renders skills and handles actions',
      (WidgetTester tester) async {
    String? selectedSkill;
    bool wasAdded = false;
    final TextEditingController controller = TextEditingController();

    addTearDown(controller.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SkillSelectionSection(
            isEnabled: true,
            options: const ['Java', 'Spring Boot'],
            selectedSkills: const ['Java'],
            controller: controller,
            onSkillSelected: (skill) {
              selectedSkill = skill;
            },
            onSkillAdded: () {
              wasAdded = true;
            },
          ),
        ),
      ),
    );

    expect(find.text('Java'), findsOneWidget);
    expect(find.text('Spring Boot'), findsOneWidget);
    expect(find.text('Add your skill or stack'), findsOneWidget);

    await tester.tap(find.text('Spring Boot'));
    await tester.pump();

    expect(selectedSkill, 'Spring Boot');

    await tester.enterText(find.byType(TextField), 'GraphQL');
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(controller.text, 'GraphQL');
    expect(wasAdded, isTrue);
  });
}
