import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/interview_setup/presentation/widgets/selectable_tag.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SelectableTag renders selected state and handles tap',
      (WidgetTester tester) async {
    bool wasSelected = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SelectableTag(
            label: 'Backend',
            isSelected: true,
            onSelected: () {
              wasSelected = true;
            },
          ),
        ),
      ),
    );

    final ChoiceChip chip = tester.widget(find.byType(ChoiceChip));

    expect(find.text('Backend'), findsOneWidget);
    expect(chip.selected, isTrue);

    await tester.tap(find.text('Backend'));
    await tester.pump();

    expect(wasSelected, isTrue);
  });
}
