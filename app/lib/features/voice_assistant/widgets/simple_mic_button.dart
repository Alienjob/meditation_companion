import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meditation_companion/features/voice_assistant/services/audio_recorder.dart';

const double _kKnobSize = 96;
const double _kKnobIconSize = 40;
const double _kTrackWidth = _kKnobSize * 1.2;
const double _kTrackHeight = _kKnobSize * 2;
const double _kTrackPadding = _kKnobSize * 0.1;
const double _kSpinnerPadding = _kKnobSize * 0.25;
const double _kStreamingIconSize = 28;
const double _kTextSpacing = 16;
const double _kHintSpacing = 12;
const Duration _kAnimationDuration = Duration(milliseconds: 250);

class SimpleMicButton extends StatefulWidget {
  const SimpleMicButton({
    super.key,
    required this.stateStream,
    this.initialState,
    required this.onTurnOnRecording,
    required this.onTurnOffRecording,
    required this.onTurnOnStreaming,
    required this.onTurnOffStreaming,
    required this.onRetry,
  });

  final Stream<AudioRecorderState> stateStream;
  final AudioRecorderState? initialState;
  final VoidCallback onTurnOnRecording;
  final VoidCallback onTurnOffRecording;
  final VoidCallback onTurnOnStreaming;
  final VoidCallback onTurnOffStreaming;
  final VoidCallback onRetry;

  @override
  State<SimpleMicButton> createState() => _SimpleMicButtonState();
}

class _SimpleMicButtonState extends State<SimpleMicButton>
    with SingleTickerProviderStateMixin {
  bool _isHolding = false;
  bool _streamingRequested = false;
  double _dragOffset = 0;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AudioRecorderState>(
      stream: widget.stateStream,
      initialData: widget.initialState,
      builder: (context, snapshot) {
        final state = snapshot.data;
        if (state == null) {
          return _buildInitializing(context);
        }
        return _buildContent(context, state);
      },
    );
  }

  Widget _buildInitializing(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: _kKnobSize,
          height: _kKnobSize,
          child: CircularProgressIndicator(color: colors.primary),
        ),
        const SizedBox(height: 24),
        Text(
          'Initializing microphone…',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context, AudioRecorderState state) {
    final colors = Theme.of(context).colorScheme;
    final bool isStreamingState = _isStreamingStatus(state.status);

    if (isStreamingState && !_streamingRequested) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() => _streamingRequested = true);
        }
      });
    } else if (!isStreamingState &&
        _streamingRequested &&
        state.status == AudioRecorderStatus.idle) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() => _streamingRequested = false);
        }
      });
    }

    final presentation = _mapPresentation(state, colors);

    final bool showSwipeHint = _isHolding &&
        !_streamingRequested &&
        state.status == AudioRecorderStatus.recordingBuffered;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _MicKnob(
          presentation: presentation,
          onTapDown: () => _handleTapDown(state),
          onTapUp: () => _handleTapUp(state),
          onTapCancel: () => _handleTapCancel(state),
          onVerticalDragStart: (_) => _handlePanStart(state),
          onVerticalDragUpdate: (details) => _handlePanUpdate(details, state),
          onVerticalDragEnd: (_) => _handlePanEnd(state),
        ),
        const SizedBox(height: 16),
        Text(
          presentation.primaryText,
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
        if (presentation.secondaryText != null) ...[
          const SizedBox(height: 8),
          Text(
            presentation.secondaryText!,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
        if (!isStreamingState)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              'Hold to record · Swipe up for streaming',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: colors.onSurfaceVariant),
              textAlign: TextAlign.center,
            ),
          )
        else
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              'Tap mic to stop streaming',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: colors.onSurfaceVariant),
              textAlign: TextAlign.center,
            ),
          ),
        if (showSwipeHint)
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              'Release to send or swipe up to stream',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: colors.onSurfaceVariant),
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }

  void _handleTapDown(AudioRecorderState state) {
    if (_isStreamingStatus(state.status)) {
      widget.onTurnOffStreaming();
      return;
    }

    if (state.status == AudioRecorderStatus.error) {
      widget.onRetry();
      return;
    }

    if (_isHolding || state.status != AudioRecorderStatus.idle) {
      return;
    }

    widget.onTurnOnRecording();
    setState(() {
      _isHolding = true;
      _streamingRequested = false;
      _dragOffset = 0;
    });
  }

  void _handleTapUp(AudioRecorderState state) {
    if (!_isHolding) return;

    if (_streamingRequested || _isStreamingStatus(state.status)) {
      setState(() => _isHolding = false);
      return;
    }

    widget.onTurnOffRecording();
    setState(() => _isHolding = false);
  }

  void _handleTapCancel(AudioRecorderState state) {
    if (!_isHolding) return;
    if (_streamingRequested || _isStreamingStatus(state.status)) {
      setState(() => _isHolding = false);
      return;
    }
    widget.onTurnOffRecording();
    setState(() => _isHolding = false);
  }

  void _handlePanStart(AudioRecorderState state) {
    if (_isStreamingStatus(state.status)) {
      return;
    }
    if (!_isHolding) {
      _handleTapDown(state);
    }
  }

  void _handlePanUpdate(
    DragUpdateDetails details,
    AudioRecorderState state,
  ) {
    if (!_isHolding || _streamingRequested) return;
    _dragOffset += details.delta.dy;
    if (_dragOffset <= -36) {
      widget.onTurnOnStreaming();
      setState(() => _streamingRequested = true);
    }
  }

  void _handlePanEnd(AudioRecorderState state) {
    _handleTapUp(state);
  }

  _ButtonPresentation _mapPresentation(
    AudioRecorderState state,
    ColorScheme colors,
  ) {
    switch (state.status) {
      case AudioRecorderStatus.idle:
        return _ButtonPresentation(
          background: colors.surfaceContainerHighest,
          icon: Icons.mic,
          iconColor: colors.onSurface,
          primaryText: 'Hold to record',
        );
      case AudioRecorderStatus.preparingBuffered:
        return _ButtonPresentation.loading(
          background: colors.surfaceVariant,
          primaryText: 'Preparing recording…',
        );
      case AudioRecorderStatus.recordingBuffered:
        return _ButtonPresentation(
          background: Colors.deepOrange.shade400,
          icon: Icons.stop,
          iconColor: colors.onPrimary,
          primaryText: 'Recording…',
          secondaryText: 'Release to send',
        );
      case AudioRecorderStatus.finalizingBuffered:
        return _ButtonPresentation.loading(
          background: Colors.deepOrange.shade200,
          primaryText: 'Processing audio…',
        );
      case AudioRecorderStatus.preparingStreaming:
        return _ButtonPresentation.loading(
          background: colors.primary.withOpacity(0.3),
          primaryText: 'Starting stream…',
        );
      case AudioRecorderStatus.streamingActive:
        return _ButtonPresentation(
          background: colors.primary,
          icon: Icons.wifi_tethering,
          iconColor: colors.onPrimary,
          primaryText: 'Streaming live…',
          secondaryText: 'Tap mic to stop',
        );
      case AudioRecorderStatus.finalizingStreaming:
        return _ButtonPresentation.loading(
          background: colors.primary.withOpacity(0.5),
          primaryText: 'Wrapping up stream…',
        );
      case AudioRecorderStatus.error:
        return _ButtonPresentation(
          background: Colors.red.shade600,
          icon: Icons.error_outline,
          iconColor: colors.onPrimary,
          primaryText: state.message ?? 'Recorder error',
          secondaryText: 'Tap to retry',
        );
    }
  }

  bool _isStreamingStatus(AudioRecorderStatus status) {
    return status == AudioRecorderStatus.preparingStreaming ||
        status == AudioRecorderStatus.streamingActive ||
        status == AudioRecorderStatus.finalizingStreaming;
  }
}

class _ButtonPresentation {
  const _ButtonPresentation({
    required this.background,
    required this.icon,
    required this.iconColor,
    required this.primaryText,
    this.secondaryText,
    this.showSpinner = false,
    this.size = _kKnobSize,
    this.iconSize = _kKnobIconSize,
    Color? spinnerColor,
  }) : spinnerColor = spinnerColor ?? Colors.white;

  const _ButtonPresentation.loading({
    required Color background,
    required String primaryText,
  }) : this(
          background: background,
          icon: Icons.hourglass_empty,
          iconColor: Colors.white,
          primaryText: primaryText,
          showSpinner: true,
          spinnerColor: background,
        );

  final Color background;
  final IconData icon;
  final Color iconColor;
  final String primaryText;
  final String? secondaryText;
  final bool showSpinner;
  final double size;
  final double iconSize;
  final Color spinnerColor;
}

class _MicKnob extends StatelessWidget {
  const _MicKnob({
    super.key,
    required this.presentation,
    required this.onTapDown,
    required this.onTapUp,
    required this.onTapCancel,
    required this.onVerticalDragStart,
    required this.onVerticalDragUpdate,
    required this.onVerticalDragEnd,
  });

  final _ButtonPresentation presentation;
  final VoidCallback onTapDown;
  final VoidCallback onTapUp;
  final VoidCallback onTapCancel;
  final GestureDragStartCallback onVerticalDragStart;
  final GestureDragUpdateCallback onVerticalDragUpdate;
  final GestureDragEndCallback onVerticalDragEnd;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(_kSpinnerPadding / 2),
          child: GestureDetector(
            dragStartBehavior: DragStartBehavior.down,
            onTapDown: (_) => onTapDown(),
            onTapUp: (_) => onTapUp(),
            onTapCancel: onTapCancel,
            onVerticalDragStart: onVerticalDragStart,
            onVerticalDragUpdate: onVerticalDragUpdate,
            onVerticalDragEnd: onVerticalDragEnd,
            child: AnimatedContainer(
              duration: _kAnimationDuration,
              curve: Curves.easeOut,
              width: presentation.size,
              height: presentation.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: presentation.background,
              ),
              child: Icon(
                presentation.icon,
                color: presentation.iconColor,
                size: presentation.iconSize,
              ),
            ),
          ),
        ),
        if (presentation.showSpinner)
          SizedBox(
            width: presentation.size + _kSpinnerPadding,
            height: presentation.size + _kSpinnerPadding,
            child: CircularProgressIndicator(
              strokeWidth: 4,
              color: presentation.spinnerColor,
            ),
          ),
      ],
    );
  }
}
