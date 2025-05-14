import 'package:flutter_test/flutter_test.dart';
import 'package:meditation_companion/features/audio/models/interruption_result.dart';

void main() {
  group('InterruptionResult', () {
    test('creates with valid parameters', () {
      final result = InterruptionResult(
        itemId: 'test_chunk',
        sampleCount: 1000,
        timestamp: 1620000000000,
      );

      expect(result.itemId, equals('test_chunk'));
      expect(result.sampleCount, equals(1000));
      expect(result.timestamp, equals(1620000000000));
    });

    test('creates with empty itemId', () {
      final result = InterruptionResult(
        itemId: '',
        sampleCount: 0,
        timestamp: 1620000000000,
      );

      expect(result.itemId, isEmpty);
      expect(result.sampleCount, equals(0));
      expect(result.timestamp, equals(1620000000000));
    });

    test('equals and hashCode work correctly', () {
      final result1 = InterruptionResult(
        itemId: 'test_chunk',
        sampleCount: 1000,
        timestamp: 1620000000000,
      );

      final result2 = InterruptionResult(
        itemId: 'test_chunk',
        sampleCount: 1000,
        timestamp: 1620000000000,
      );

      final different = InterruptionResult(
        itemId: 'other_chunk',
        sampleCount: 1000,
        timestamp: 1620000000000,
      );

      expect(result1, equals(result2));
      expect(result1.hashCode, equals(result2.hashCode));
      expect(result1, isNot(equals(different)));
    });

    test('toString provides meaningful description', () {
      final result = InterruptionResult(
        itemId: 'test_chunk',
        sampleCount: 1000,
        timestamp: 1620000000000,
      );

      expect(
        result.toString(),
        contains('test_chunk'),
        reason: 'toString should include the itemId',
      );
      expect(
        result.toString(),
        contains('1000'),
        reason: 'toString should include the sampleCount',
      );
      expect(
        result.toString(),
        contains('1620000000000'),
        reason: 'toString should include the timestamp',
      );
    });

    test('const constructor creates identical instances', () {
      const result1 = InterruptionResult(
        itemId: 'test_chunk',
        sampleCount: 1000,
        timestamp: 1620000000000,
      );

      const result2 = InterruptionResult(
        itemId: 'test_chunk',
        sampleCount: 1000,
        timestamp: 1620000000000,
      );

      expect(identical(result1, result2), isTrue);
    });

    test('compares fields individually', () {
      final base = InterruptionResult(
        itemId: 'test_chunk',
        sampleCount: 1000,
        timestamp: 1620000000000,
      );

      final differentId = InterruptionResult(
        itemId: 'other_chunk',
        sampleCount: 1000,
        timestamp: 1620000000000,
      );

      final differentSamples = InterruptionResult(
        itemId: 'test_chunk',
        sampleCount: 2000,
        timestamp: 1620000000000,
      );

      final differentTimestamp = InterruptionResult(
        itemId: 'test_chunk',
        sampleCount: 1000,
        timestamp: 1620000001000,
      );

      expect(base, isNot(equals(differentId)));
      expect(base, isNot(equals(differentSamples)));
      expect(base, isNot(equals(differentTimestamp)));
    });
  });
}
