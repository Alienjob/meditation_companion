import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/assistant_bloc.dart';
import '../bloc/assistant_event.dart';
import '../bloc/assistant_state.dart';
import '../services/audio_recorder.dart';

class GlobalMicButton extends StatefulWidget {
  const GlobalMicButton({super.key});

  @override
  State<GlobalMicButton> createState() => _GlobalMicButtonState();
}

class _GlobalMicButtonState extends State<GlobalMicButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _rippleController;

  bool _isHolding = false;
  bool _streamingRequested = false;
  double _dragOffset = 0;

  @override
  void initState() {
    super.initState();
    _rippleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _rippleController.dispose();
    super.dispose();
  }

  Future<void> _startHold(AssistantState currentState) async {
    if (_isHolding) return;
    final assistantBloc = context.read<AssistantBloc>();
    AssistantState assistantState = currentState;

    if (!assistantState.canRecord) {
      if (assistantState.canInterrupt) {
        assistantBloc.add(InterruptResponse());
        try {
          assistantState = await assistantBloc.stream
              .firstWhere(
                (state) => state.canRecord,
                orElse: () => assistantBloc.state,
              )
              .timeout(const Duration(milliseconds: 600));
        } catch (_) {
          assistantState = assistantBloc.state;
        }
      }

      if (!assistantState.canRecord) {
        return;
      }
    }

    assistantBloc.add(StartRecordingUserAudioInput());
    setState(() {
      _isHolding = true;
      _streamingRequested = false;
      _dragOffset = 0;
    });
  }

  void _requestStreaming(AssistantState assistantState) {
    if (_streamingRequested || assistantState.streamingEnabled) return;
    _streamingRequested = true;
    context.read<AssistantBloc>().add(const ToggleStreamingMode(true));
    setState(() {});
  }

  void _handlePanUpdate(
    DragUpdateDetails details,
    AssistantState assistantState,
  ) {
    if (!_isHolding) return;
    _dragOffset += details.delta.dy;
    if (!_streamingRequested && _dragOffset <= -36) {
      _requestStreaming(assistantState);
    }
  }

  void _onPanStart(AssistantState assistantState) {
    if (assistantState.streamingEnabled) {
      return;
    }
    unawaited(_startHold(assistantState));
  }

  void _stopStreaming(AssistantState assistantState) {
    final assistantBloc = context.read<AssistantBloc>();
    if (assistantState.userInput == UserInputState.recording) {
      assistantBloc.add(StopRecordingUserAudioInput());
    }
    if (assistantState.streamingEnabled) {
      Future.microtask(() {
        assistantBloc.add(const ToggleStreamingMode(false));
      });
    }
    setState(() {
      _isHolding = false;
      _streamingRequested = false;
      _dragOffset = 0;
    });
  }

  void _finishHold(AssistantState assistantState) {
    if (!_isHolding) return;
    if (assistantState.streamingEnabled || _streamingRequested) {
      setState(() {
        _isHolding = false;
        _streamingRequested =
            _streamingRequested || assistantState.streamingEnabled;
        _dragOffset = 0;
      });
      return;
    }

    final assistantBloc = context.read<AssistantBloc>();
    assistantBloc.add(StopRecordingUserAudioInput());
    setState(() {
      _isHolding = false;
      _streamingRequested = false;
      _dragOffset = 0;
    });
  }

  void _cancelHold(AssistantState assistantState) {
    if (!_isHolding) return;
    if (assistantState.streamingEnabled || _streamingRequested) {
      _stopStreaming(assistantState);
      return;
    }

    final assistantBloc = context.read<AssistantBloc>();
    assistantBloc.add(StopRecordingUserAudioInput());
    setState(() {
      _isHolding = false;
      _streamingRequested = false;
      _dragOffset = 0;
    });
  }

  Future<void> _handleTapDown(AssistantState assistantState) async {
    if (!_isHolding && assistantState.streamingEnabled) {
      _stopStreaming(assistantState);
      return;
    }
    await _startHold(assistantState);
  }

  void _handleTapUp(AssistantState assistantState) {
    _finishHold(assistantState);
  }

  @override
  Widget build(BuildContext context) {
    final recorder = context.read<AudioRecorder>();
    return BlocBuilder<AssistantBloc, AssistantState>(
      builder: (context, assistantState) {
        return StreamBuilder<AudioRecorderState>(
          stream: recorder.stateStream,
          initialData: recorder.currentState,
          builder: (context, snapshot) {
            final recorderState = snapshot.data ?? AudioRecorderState.idle();
            final colors = Theme.of(context).colorScheme;

            final recorderError =
                recorderState.status == AudioRecorderStatus.error;
            final assistantError =
                assistantState.clientStatus == ClientStatus.error ||
                    assistantState.lastError != null;
            final isError = recorderError || assistantError;

            final isStreamingFace =
                recorderState.mode == AudioRecorderMode.streaming ||
                    recorderState.status ==
                        AudioRecorderStatus.preparingStreaming ||
                    recorderState.status ==
                        AudioRecorderStatus.finalizingStreaming ||
                    assistantState.streamingEnabled ||
                    _streamingRequested;
            final showSpinner =
                recorderState.status == AudioRecorderStatus.preparingBuffered ||
                    recorderState.status ==
                        AudioRecorderStatus.finalizingBuffered ||
                    recorderState.status ==
                        AudioRecorderStatus.preparingStreaming ||
                    recorderState.status ==
                        AudioRecorderStatus.finalizingStreaming ||
                    assistantState.userInput == UserInputState.recorded ||
                    assistantState.responseState == ResponseState.responding;
            final showRipple =
                recorderState.status == AudioRecorderStatus.streamingActive;

            if (showRipple && !_rippleController.isAnimating) {
              _rippleController.repeat();
            } else if (!showRipple && _rippleController.isAnimating) {
              _rippleController.stop();
            }

            final baseColor = _resolveBaseColor(
              colors,
              recorderState,
              isStreamingFace,
              isError,
            );
            final iconData = _resolveIcon(
              recorderState,
              isStreamingFace,
              isError,
            );

            final String? errorMessage = recorderError
                ? recorderState.message
                : assistantState.lastError;
            final (primaryText, secondaryText) = _resolveStatusText(
              recorderState,
              assistantState,
              isError,
              errorMessage,
            );

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  dragStartBehavior: DragStartBehavior.down,
                  onTapDown: (_) => _handleTapDown(assistantState),
                  onTapUp: (_) => _handleTapUp(assistantState),
                  onTapCancel: () => _cancelHold(assistantState),
                  onVerticalDragStart: (_) => _onPanStart(assistantState),
                  onVerticalDragUpdate: (details) =>
                      _handlePanUpdate(details, assistantState),
                  onVerticalDragEnd: (_) => _finishHold(assistantState),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if (showRipple) _buildRipple(baseColor),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeOut,
                        width: isStreamingFace ? 108 : 96,
                        height: isStreamingFace ? 108 : 96,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: baseColor,
                        ),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 250),
                          transitionBuilder: (child, animation) {
                            return RotationTransition(
                              turns: Tween<double>(begin: 0.5, end: 1)
                                  .animate(animation),
                              child: FadeTransition(
                                opacity: animation,
                                child: child,
                              ),
                            );
                          },
                          child: Icon(
                            iconData,
                            key: ValueKey(iconData.codePoint),
                            color: colors.onPrimary,
                            size: isStreamingFace ? 46 : 40,
                          ),
                        ),
                      ),
                      if (showSpinner)
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: CircularProgressIndicator(
                            strokeWidth: 4,
                            color: colors.onPrimary,
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  primaryText,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                if (_shouldShowSwipeHint(recorderState, assistantState))
                  const SizedBox(height: 8),
                if (_shouldShowSwipeHint(recorderState, assistantState))
                  Text(
                    'Swipe up for streaming',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                if (secondaryText != null &&
                    !_shouldShowSwipeHint(recorderState, assistantState))
                  const SizedBox(height: 8),
                if (secondaryText != null &&
                    !_shouldShowSwipeHint(recorderState, assistantState))
                  Text(
                    secondaryText,
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                if (!assistantState.streamingEnabled)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      'Hold to record · Swipe up for streaming',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                if (assistantState.streamingEnabled)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      'Tap mic to stop streaming',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            );
          },
        );
      },
    );
  }

  bool _shouldShowSwipeHint(
    AudioRecorderState recorderState,
    AssistantState assistantState,
  ) {
    return _isHolding &&
        !_streamingRequested &&
        assistantState.canRecord &&
        (recorderState.status == AudioRecorderStatus.recordingBuffered ||
            recorderState.status == AudioRecorderStatus.preparingBuffered);
  }

  (String, String?) _resolveStatusText(
    AudioRecorderState recorderState,
    AssistantState assistantState,
    bool isError,
    String? errorMessage,
  ) {
    if (isError) {
      return (
        errorMessage ?? 'Recorder error',
        'Press and hold to retry',
      );
    }

    if (!assistantState.canRecord &&
        assistantState.userInput != UserInputState.recording) {
      if (assistantState.responseState == ResponseState.responding) {
        return ('Assistant processing…', 'Wait for response to finish');
      }
      switch (assistantState.clientStatus) {
        case ClientStatus.connecting:
          return ('Connecting to assistant…', null);
        case ClientStatus.rateLimited:
          return ('Assistant busy, retry soon', null);
        case ClientStatus.error:
          return ('Assistant error', 'Press and hold to retry');
        case ClientStatus.ready:
          break;
      }
    }

    if (assistantState.userInput == UserInputState.recorded) {
      return ('Processing audio…', 'Sending to assistant');
    }

    switch (recorderState.status) {
      case AudioRecorderStatus.idle:
        return ('Hold to record', null);
      case AudioRecorderStatus.preparingBuffered:
        return ('Preparing microphone…', null);
      case AudioRecorderStatus.recordingBuffered:
        return ('Recording message…', null);
      case AudioRecorderStatus.finalizingBuffered:
        return ('Processing audio…', null);
      case AudioRecorderStatus.preparingStreaming:
        return ('Starting stream…', 'Release to send');
      case AudioRecorderStatus.streamingActive:
        return ('Streaming live…', 'Tap mic to stop');
      case AudioRecorderStatus.finalizingStreaming:
        return ('Wrapping up stream…', null);
      case AudioRecorderStatus.error:
        return ('Recorder error', 'Press and hold to retry');
    }
  }

  IconData _resolveIcon(
    AudioRecorderState recorderState,
    bool isStreamingFace,
    bool isError,
  ) {
    if (isError) return Icons.error_outline;
    if (isStreamingFace) return Icons.wifi_tethering;
    if (recorderState.status == AudioRecorderStatus.recordingBuffered) {
      return Icons.mic;
    }
    return Icons.mic_none;
  }

  Color _resolveBaseColor(
    ColorScheme colors,
    AudioRecorderState recorderState,
    bool isStreamingFace,
    bool isError,
  ) {
    if (isError) {
      return Colors.red.shade600;
    }
    if (isStreamingFace ||
        recorderState.status == AudioRecorderStatus.preparingStreaming ||
        recorderState.status == AudioRecorderStatus.finalizingStreaming) {
      return colors.primary;
    }
    if (recorderState.status == AudioRecorderStatus.recordingBuffered ||
        recorderState.status == AudioRecorderStatus.preparingBuffered ||
        recorderState.status == AudioRecorderStatus.finalizingBuffered) {
      return Colors.deepOrange.shade400;
    }
    return colors.surfaceContainerHighest;
  }

  Widget _buildRipple(Color color) {
    return AnimatedBuilder(
      animation: _rippleController,
      builder: (context, child) {
        final value = _rippleController.value;
        final size = 140 + (value * 60);
        final opacity = (1 - value).clamp(0.0, 1.0);
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withValues(alpha: 0.25 * opacity),
          ),
        );
      },
    );
  }
}
