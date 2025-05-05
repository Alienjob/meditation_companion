import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:meditation_companion/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Browser Integration Tests', () {
    testWidgets('Full app flow test in browser', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      // Verify initial state
      expect(find.text('Meditation Companion'), findsOneWidget);
      expect(find.text('0'), findsOneWidget);
      expect(find.byTooltip('Increment'), findsOneWidget);

      // Test counter interaction
      await tester.tap(find.byTooltip('Increment'));
      await tester.pumpAndSettle();
      expect(find.text('1'), findsOneWidget);

      // Test counter multiple times
      await tester.tap(find.byTooltip('Increment'));
      await tester.tap(find.byTooltip('Increment'));
      await tester.pumpAndSettle();
      expect(find.text('3'), findsOneWidget);

      // Test text visibility and layout
      expect(
        find.text('You have pushed the button this many times:'),
        findsOneWidget,
      );
    });

    testWidgets('Responsive layout test in browser',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      // Mobile size test
      await tester.binding.setSurfaceSize(const Size(360, 640));
      await tester.pumpAndSettle();

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byTooltip('Increment'), findsOneWidget);

      // Tablet size test
      await tester.binding.setSurfaceSize(const Size(768, 1024));
      await tester.pumpAndSettle();

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byTooltip('Increment'), findsOneWidget);

      // Desktop size test
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester.pumpAndSettle();

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byTooltip('Increment'), findsOneWidget);
    });
  });
}
