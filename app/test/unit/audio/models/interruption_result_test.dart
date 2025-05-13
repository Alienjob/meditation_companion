import 'package:flutter_test/flutter_test.dart';
import 'package:meditation_companion/features/audio/models/interruption_result.dart';

void main() {
  group('InterruptionResult', () {
    test('should create instance with required parameters', () {
      final result = InterruptionResult(
        itemId: 'test_id',
        sampleCount: 1000,
        timestamp: 1620000000000,
      );

      expect(result.itemId, 'test_id');
      expect(result.sampleCount, 1000);
      expect(result.timestamp, 1620000000000);
    });

    test('should be immutable', () {
      // Verify const constructor works
      const instance1 = InterruptionResult(
        itemId: 'test_id',
        sampleCount: 1000,
        timestamp: 1620000000000,
      );

      const instance2 = InterruptionResult(
        itemId: 'test_id',
        sampleCount: 1000,
        timestamp: 1620000000000,
      );

      // Same values should create identical instances
      expect(identical(instance1, instance2), isTrue);

      // Fields should be final
      final result = const InterruptionResult(
        itemId: 'test_id',
        sampleCount: 1000,
        timestamp: 1620000000000,
      );

      expect(result.runtimeType.toString(), contains('InterruptionResult'));
    });

    test('equals should work correctly', () {
      const result1 = InterruptionResult(
        itemId: 'test_id',
        sampleCount: 1000,
        timestamp: 1620000000000,
      );

      const result2 = InterruptionResult(
        itemId: 'test_id',
        sampleCount: 1000,
        timestamp: 1620000000000,
      );

      const result3 = InterruptionResult(
        itemId: 'different_id',
        sampleCount: 1000,
        timestamp: 1620000000000,
      );

      expect(result1, equals(result2));
      expect(result1, isNot(equals(result3)));
    });

    test('props should contain all fields', () {
      const result = InterruptionResult(
        itemId: 'test_id',
        sampleCount: 1000,
        timestamp: 1620000000000,
      );

      expect(
          result.props,
          containsAll([
            'test_id',
            1000,
            1620000000000,
          ]));
    });

    test('toString provides meaningful description', () {
      const result = InterruptionResult(
        itemId: 'test_id',
        sampleCount: 1000,
        timestamp: 1620000000000,
      );

      expect(result.toString(), contains('itemId'));
      expect(result.toString(), contains('test_id'));
      expect(result.toString(), contains('sampleCount'));
      expect(result.toString(), contains('1000'));
      expect(result.toString(), contains('timestamp'));
      expect(result.toString(), contains('1620000000000'));
    });
  });
}
