import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_event.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_state.dart';
import 'package:meditation_companion/features/meditation/models/meditation_session.dart';
import 'package:meditation_companion/features/meditation/services/audio_service.dart';
import 'package:meditation_companion/features/meditation/services/timer_service.dart';

class MeditationBloc extends Bloc<MeditationEvent, MeditationState> {
  final TimerService _timerService;
  final AudioService _audioService;

  StreamSubscription<Duration>? _timerSubscription;
  StreamSubscription<Map<String, dynamic>>? _audioSubscription;

  MeditationBloc({
    required TimerService timerService,
    required AudioService audioService,
  })  : _timerService = timerService,
        _audioService = audioService,
        super(MeditationInitial()) {
    on<StartMeditation>(_onStartMeditation);
    on<PauseMeditation>(_onPauseMeditation);
    on<ResumeMeditation>(_onResumeMeditation);
    on<StopMeditation>(_onStopMeditation);
    on<MeditationTimeUpdated>(_onMeditationTimeUpdated);
    on<ToggleSound>(_onToggleSound);
    on<AdjustVolume>(_onAdjustVolume);
    on<SoundSettingsUpdated>(_onSoundSettingsUpdated);

    // Listen to audio settings updates
    _audioSubscription = _audioService.soundSettingsStream.listen(
      (settings) => add(SoundSettingsUpdated(settings: settings)),
    );
  }

  Future<void> _onStartMeditation(
    StartMeditation event,
    Emitter<MeditationState> emit,
  ) async {
    try {
      // Cancel any existing timer subscription
      await _timerSubscription?.cancel();

      // Create new session
      final session = MeditationSession(
        duration: event.duration,
        status: MeditationStatus.running,
      );

      // Start timer and listen for updates
      await _timerService.start(event.duration);
      _timerSubscription = _timerService.timeStream.listen(
        (time) => add(MeditationTimeUpdated(currentTime: time)),
      );

      // Emit initial active state with current sound settings
      emit(MeditationActive(
        session: session,
        soundSettings: _audioService.getCurrentSoundSettings(),
      ));
    } catch (e) {
      emit(MeditationError(message: 'Failed to start meditation: $e'));
    }
  }

  Future<void> _onPauseMeditation(
    PauseMeditation event,
    Emitter<MeditationState> emit,
  ) async {
    if (state is MeditationActive) {
      final currentState = state as MeditationActive;
      try {
        await _timerService.pause();
        emit(currentState.copyWith(
          session: currentState.session.copyWith(
            status: MeditationStatus.paused,
          ),
        ));
      } catch (e) {
        emit(MeditationError(message: 'Failed to pause meditation: $e'));
      }
    }
  }

  Future<void> _onResumeMeditation(
    ResumeMeditation event,
    Emitter<MeditationState> emit,
  ) async {
    if (state is MeditationActive) {
      final currentState = state as MeditationActive;
      try {
        await _timerService.resume();
        emit(currentState.copyWith(
          session: currentState.session.copyWith(
            status: MeditationStatus.running,
          ),
        ));
      } catch (e) {
        emit(MeditationError(message: 'Failed to resume meditation: $e'));
      }
    }
  }

  Future<void> _onStopMeditation(
    StopMeditation event,
    Emitter<MeditationState> emit,
  ) async {
    if (state is MeditationActive) {
      final currentState = state as MeditationActive;
      try {
        await Future.wait([
          _timerService.stop(),
          _audioService.stopAllSounds(),
        ]);
        emit(MeditationCompleted(session: currentState.session));
      } catch (e) {
        emit(MeditationError(message: 'Failed to stop meditation: $e'));
      }
    }
  }

  Future<void> _onMeditationTimeUpdated(
    MeditationTimeUpdated event,
    Emitter<MeditationState> emit,
  ) async {
    if (state is MeditationActive) {
      final currentState = state as MeditationActive;
      final updatedSession = currentState.session.copyWith(
        currentTime: event.currentTime,
      );

      // Check if meditation is complete
      if (updatedSession.currentTime >= updatedSession.duration) {
        await _onStopMeditation(StopMeditation(), emit);
      } else {
        emit(currentState.copyWith(session: updatedSession));
      }
    }
  }

  Future<void> _onToggleSound(
    ToggleSound event,
    Emitter<MeditationState> emit,
  ) async {
    try {
      await _audioService.toggleSound(event.soundId, event.active);
    } catch (e) {
      emit(MeditationError(message: 'Failed to toggle sound: $e'));
    }
  }

  Future<void> _onAdjustVolume(
    AdjustVolume event,
    Emitter<MeditationState> emit,
  ) async {
    try {
      await _audioService.setVolume(event.soundId, event.volume);
    } catch (e) {
      emit(MeditationError(message: 'Failed to adjust volume: $e'));
    }
  }

  void _onSoundSettingsUpdated(
    SoundSettingsUpdated event,
    Emitter<MeditationState> emit,
  ) {
    if (state is MeditationActive) {
      final currentState = state as MeditationActive;
      emit(currentState.copyWith(soundSettings: event.settings));
    }
  }

  @override
  Future<void> close() async {
    await _timerSubscription?.cancel();
    await _audioSubscription?.cancel();
    await _timerService.dispose();
    await _audioService.dispose();
    return super.close();
  }
}
