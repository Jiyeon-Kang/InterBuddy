import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/widgets/app_header.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AppHeader renders the given title', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          appBar: AppHeader(title: 'Test Header'),
        ),
      ),
    );

    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text('Test Header'), findsOneWidget);
  });
}
