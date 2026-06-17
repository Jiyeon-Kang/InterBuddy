import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/interview_setup/presentation/widgets/selectable_tag_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SelectableTagList renders options and emits selected option',
      (WidgetTester tester) async {
    String? selectedOption;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SelectableTagList(
            options: const ['Frontend', 'Backend'],
            selectedOptions: const ['Frontend'],
            onSelected: (option) {
              selectedOption = option;
            },
          ),
        ),
      ),
    );

    expect(find.text('Frontend'), findsOneWidget);
    expect(find.text('Backend'), findsOneWidget);

    await tester.tap(find.text('Backend'));
    await tester.pump();

    expect(selectedOption, 'Backend');
  });
}
