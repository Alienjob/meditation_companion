import 'dart:async';
import 'package:meditation_companion/features/meditation/services/timer_service.dart';

class RealTimerService implements TimerService {
  Timer? _timer;
  Duration _duration = Duration.zero;
  Duration _currentTime = Duration.zero;
  bool _isRunning = false;
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

    _timer = Timer.periodic(const Duration(seconds: 1), _onTick);
    _timeController.add(_currentTime);
  }

  void _onTick(Timer timer) {
    if (!_isRunning) return;

    _currentTime += const Duration(seconds: 1);
    _timeController.add(_currentTime);

    if (_currentTime >= _duration) {
      timer.cancel();
      _isRunning = false;
    }
  }

  @override
  Future<void> pause() async {
    _timer?.cancel();
    _isRunning = false;
  }

  @override
  Future<void> resume() async {
    if (_currentTime >= _duration) return;

    _isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), _onTick);
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
    final timeLeft = _duration - _currentTime;
    return timeLeft.isNegative ? Duration.zero : timeLeft;
  }

  @override
  Future<void> dispose() async {
    await stop();
    await _timeController.close();
  }
}
