import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meditation_companion/main.dart';

void main() {
  group('Counter Button Widget Tests', () {
    testWidgets('Counter button should be visible and tappable',
        (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(const MaterialApp(
        home: MyHomePage(title: 'Test Page'),
      ));

      // Find the FloatingActionButton
      final buttonFinder = find.byType(FloatingActionButton);
      expect(buttonFinder, findsOneWidget);

      // Verify it has the correct icon
      final iconFinder = find.byIcon(Icons.add);
      expect(iconFinder, findsOneWidget);

      // Test the button tap
      await tester.tap(buttonFinder);
      await tester.pump();

      // Verify counter increased
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('Counter button should increment multiple times',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: MyHomePage(title: 'Test Page'),
      ));

      // Tap multiple times
      final buttonFinder = find.byType(FloatingActionButton);

      for (var i = 0; i < 3; i++) {
        await tester.tap(buttonFinder);
        await tester.pump();
      }

      // Verify counter is at 3
      expect(find.text('3'), findsOneWidget);
    });
  });
}
