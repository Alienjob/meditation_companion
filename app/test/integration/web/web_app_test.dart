import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meditation_companion/main.dart';

void main() {
  testWidgets('Web app renders correctly and counter works',
      (WidgetTester tester) async {
    // Build our app
    await tester.pumpWidget(const MyApp());

    // Wait for any animations/loads to complete
    await tester.pumpAndSettle();

    // Test initial state
    expect(find.text('Meditation Companion'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);

    // Test counter functionality
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);

    // Verify layout elements
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);

    // Verify specific elements in the layout
    expect(find.text('You have pushed the button this many times:'),
        findsOneWidget);
    expect(find.ancestor(of: find.text('1'), matching: find.byType(Center)),
        findsOneWidget);
  });

  testWidgets('App is responsive', (WidgetTester tester) async {
    // Set up a tablet-sized screen
    await tester.binding.setSurfaceSize(const Size(1024, 768));

    // Build our app
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Verify layout still works at tablet size
    expect(find.text('Meditation Companion'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);

    // Change to mobile size
    await tester.binding.setSurfaceSize(const Size(375, 812));
    await tester.pumpAndSettle();

    // Verify layout still works at mobile size
    expect(find.text('Meditation Companion'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}
