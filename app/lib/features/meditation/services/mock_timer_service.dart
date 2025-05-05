import 'dart:async';

import 'package:meditation_companion/features/meditation/services/timer_service.dart';

/// Mock implementation of [TimerService] for testing and development
class MockTimerService implements TimerService {
  Duration _duration = Duration.zero;
  Duration _currentTime = Duration.zero;
  bool _isRunning = false;
  Timer? _timer;

  final _timeController = StreamController<Duration>.broadcast();

  @override
  Stream<Duration> get timeStream => _timeController.stream;

  @override
  Duration get currentTime => _currentTime;

  @override
  bool get isRunning => _isRunning;

  @override
  Future<void> start(Duration duration) async {
    if (duration <= Duration.zero) {
      throw ArgumentError('Duration must be positive');
    }

    // Stop any existing timer
    await stop();

    _duration = duration;
    _currentTime = Duration.zero;
    _isRunning = true;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_currentTime < _duration) {
        _currentTime += Duration(seconds: 1);
        _timeController.add(_currentTime);

        // Check if we've reached the duration after increment
        if (_currentTime >= _duration) {
          _isRunning = false;
          timer.cancel();
        }
      }
    });
  }

  @override
  Future<void> pause() async {
    if (!_isRunning) return;

    _timer?.cancel();
    _isRunning = false;
  }

  @override
  Future<void> resume() async {
    if (_isRunning || _currentTime >= _duration) return;

    _isRunning = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_currentTime < _duration) {
        _currentTime += Duration(seconds: 1);
        _timeController.add(_currentTime);

        // Check if we've reached the duration after increment
        if (_currentTime >= _duration) {
          _isRunning = false;
          timer.cancel();
        }
      }
    });
  }

  @override
  Future<void> stop() async {
    _timer?.cancel();
    _isRunning = false;
    _currentTime = Duration.zero;
    _duration = Duration.zero;
  }

  @override
  Duration getTimeLeft() {
    if (_duration == Duration.zero) return Duration.zero;
    return _duration - _currentTime;
  }

  @override
  Future<void> dispose() async {
    await stop();
    await _timeController.close();
  }
}
