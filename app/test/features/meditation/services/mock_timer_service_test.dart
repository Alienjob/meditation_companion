import 'package:flutter_test/flutter_test.dart';
import 'package:meditation_companion/features/meditation/services/mock_timer_service.dart';

void main() {
  group('MockTimerService', () {
    late MockTimerService timerService;

    setUp(() {
      timerService = MockTimerService();
    });

    tearDown(() async {
      await timerService.dispose();
    });

    test('initial state should be correct', () {
      expect(timerService.isRunning, false);
      expect(timerService.currentTime, Duration.zero);
      expect(timerService.getTimeLeft(), Duration.zero);
    });

    test('should throw ArgumentError when starting with non-positive duration',
        () {
      expect(
        () => timerService.start(Duration.zero),
        throwsArgumentError,
      );
      expect(
        () => timerService.start(Duration(seconds: -1)),
        throwsArgumentError,
      );
    });

    test('start should initialize timer correctly', () async {
      await timerService.start(Duration(minutes: 5));

      expect(timerService.isRunning, true);
      expect(timerService.currentTime, Duration.zero);
      expect(timerService.getTimeLeft(), Duration(minutes: 5));
    });

    test('pause should stop the timer', () async {
      await timerService.start(Duration(minutes: 5));
      await timerService.pause();

      expect(timerService.isRunning, false);
    });

    test('resume should continue the timer', () async {
      await timerService.start(Duration(minutes: 5));
      await timerService.pause();
      await timerService.resume();

      expect(timerService.isRunning, true);
    });

    test('stop should reset the timer', () async {
      await timerService.start(Duration(minutes: 5));
      await timerService.stop();

      expect(timerService.isRunning, false);
      expect(timerService.currentTime, Duration.zero);
      expect(timerService.getTimeLeft(), Duration.zero);
    });

    test('timeStream should emit updates', () async {
      final emissions = <Duration>[];
      final subscription = timerService.timeStream.listen(emissions.add);

      await timerService.start(Duration(seconds: 2));

      // Wait slightly longer than 2 seconds to ensure all emissions are received
      await Future.delayed(Duration(milliseconds: 2200));

      expect(emissions.length, 2);
      expect(emissions[0], Duration(seconds: 1));
      expect(emissions[1], Duration(seconds: 2));

      await subscription.cancel();
    });

    test('timer should stop automatically when duration is reached', () async {
      await timerService.start(Duration(seconds: 2));

      // Wait slightly longer than duration to ensure timer completes
      await Future.delayed(Duration(milliseconds: 2200));

      // isRunning should be false after duration is reached
      expect(timerService.isRunning, false);
      expect(timerService.currentTime, Duration(seconds: 2));
    });

    test('pause and resume should maintain current time', () async {
      await timerService.start(Duration(seconds: 5));

      // Wait for 2 seconds
      await Future.delayed(Duration(milliseconds: 2100));

      // Get time at pause
      final timeAtPause = timerService.currentTime;
      await timerService.pause();
      expect(timeAtPause.inSeconds, 2);

      // Wait while paused - time should not change
      await Future.delayed(Duration(seconds: 1));
      expect(timerService.currentTime, timeAtPause);

      // Resume and verify time continues
      await timerService.resume();
      await Future.delayed(Duration(milliseconds: 1100));
      expect(timerService.currentTime.inSeconds, 3);
    });

    test('starting new timer should cancel existing one', () async {
      await timerService.start(Duration(minutes: 5));
      await Future.delayed(Duration(seconds: 1));

      // Start new timer
      final newDuration = Duration(minutes: 3);
      await timerService.start(newDuration);

      expect(timerService.getTimeLeft(), newDuration);
      expect(timerService.currentTime, Duration.zero);
      expect(timerService.isRunning, true);
    });
  });
}
