import 'dart:async';
import 'dart:developer' as dev;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_event.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_state.dart';
import 'package:meditation_companion/features/meditation/models/meditation_session.dart';
import 'package:meditation_companion/features/meditation/models/ambient_sound_settings.dart';
import 'package:meditation_companion/features/meditation/services/audio_service.dart';
import 'package:meditation_companion/features/meditation/services/timer_service.dart';

class MeditationBloc extends Bloc<MeditationEvent, MeditationState> {
  final TimerService _timerService;
  final AudioService _audioService;
  StreamSubscription<Duration>? _timerSubscription;
  StreamSubscription<Map<String, AmbientSoundSettings>>? _audioSubscription;

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
    on<ToggleSound>(_onToggleSound);
    on<AdjustVolume>(_onAdjustVolume);
    on<UpdateTime>(_onUpdateTime);
    on<UpdateSoundSettings>(_onUpdateSoundSettings);

    _audioSubscription = _audioService.soundSettingsStream.listen(
      (settings) => add(UpdateSoundSettings(settings)),
    );
  }

  Future<void> _onStartMeditation(
    StartMeditation event,
    Emitter<MeditationState> emit,
  ) async {
    try {
      await _timerService.start(event.duration);
      _subscribeToTimer();

      emit(MeditationActive(
        session: MeditationSession.initial(duration: event.duration),
        soundSettings: _audioService.getCurrentSoundSettings(),
      ));
    } catch (e) {
      emit(MeditationError(message: e.toString()));
    }
  }

  Future<void> _onPauseMeditation(
    PauseMeditation event,
    Emitter<MeditationState> emit,
  ) async {
    if (state is MeditationActive) {
      try {
        await _timerService.pause();
        final currentState = state as MeditationActive;
        emit(MeditationActive(
          session: currentState.session.copyWith(
            status: MeditationStatus.paused,
          ),
          soundSettings: currentState.soundSettings,
        ));
      } catch (e) {
        emit(MeditationError(message: e.toString()));
      }
    }
  }

  Future<void> _onResumeMeditation(
    ResumeMeditation event,
    Emitter<MeditationState> emit,
  ) async {
    if (state is MeditationActive) {
      try {
        await _timerService.resume();
        final currentState = state as MeditationActive;
        emit(MeditationActive(
          session: currentState.session.copyWith(
            status: MeditationStatus.running,
          ),
          soundSettings: currentState.soundSettings,
        ));
      } catch (e) {
        emit(MeditationError(message: e.toString()));
      }
    }
  }

  Future<void> _onStopMeditation(
    StopMeditation event,
    Emitter<MeditationState> emit,
  ) async {
    try {
      await _timerService.stop();
      await _audioService.stopAllSounds();
      _unsubscribeFromTimer();
      emit(MeditationInitial());
    } catch (e) {
      emit(MeditationError(message: e.toString()));
    }
  }

  Future<void> _onToggleSound(
    ToggleSound event,
    Emitter<MeditationState> emit,
  ) async {
    try {
      await _audioService.toggleSound(event.soundId, event.active);
    } catch (e) {
      emit(MeditationError(message: e.toString()));
    }
  }

  Future<void> _onAdjustVolume(
    AdjustVolume event,
    Emitter<MeditationState> emit,
  ) async {
    try {
      await _audioService.setVolume(event.soundId, event.volume);
    } catch (e) {
      emit(MeditationError(message: e.toString()));
    }
  }

  Future<void> _onUpdateTime(
    UpdateTime event,
    Emitter<MeditationState> emit,
  ) async {
    dev.log('UpdateTime: ${event.time}');

    if (state is! MeditationActive) return;

    final currentState = state as MeditationActive;
    final session = currentState.session;

    if (event.time >= session.duration) {
      dev.log('Time is up, completing meditation');
      final completedSession = session.copyWith(
        status: MeditationStatus.completed,
        currentTime: session.duration,
      );

      await _audioService.stopAllSounds();
      await _timerService.stop();
      _unsubscribeFromTimer();

      emit(MeditationCompleted(session: completedSession));
      dev.log('Emitted completed state');
    } else {
      emit(MeditationActive(
        session: session.copyWith(currentTime: event.time),
        soundSettings: currentState.soundSettings,
      ));
    }
  }

  void _onUpdateSoundSettings(
    UpdateSoundSettings event,
    Emitter<MeditationState> emit,
  ) {
    if (state is MeditationActive) {
      emit(MeditationActive(
        session: (state as MeditationActive).session,
        soundSettings: event.settings,
      ));
    }
  }

  void _subscribeToTimer() {
    _timerSubscription?.cancel();
    _timerSubscription = _timerService.timeStream.listen(
      (time) => add(UpdateTime(time)),
    );
  }

  void _unsubscribeFromTimer() {
    _timerSubscription?.cancel();
    _timerSubscription = null;
  }

  @override
  Future<void> close() async {
    await _timerSubscription?.cancel();
    await _audioSubscription?.cancel();
    await _audioService.stopAllSounds();
    return super.close();
  }
}
