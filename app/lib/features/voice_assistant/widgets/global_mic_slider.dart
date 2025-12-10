import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:meditation_companion/features/voice_assistant/services/audio_recorder.dart';

// Оптимистичные переходы без прыжков
// игнорирование тапа на микрофон - минимальное время зажатия 300мс
// При получении статуса ошибки - анимация а не прыжок
// Tap to reset и анимация обработки ошибки

const double _kSliderWidth = 56;
const double _kThumbDiameter = 96;
const double _kThumbIconSize = 40;
const double _kTrackHeight = _kThumbDiameter * 2;
const double _kTrackThickness = _kThumbDiameter + 20;
const double _kStreamingIconSize = 28;
const double _kTextSpacing = 16;
const double _kHintSpacing = 12;
const double _kSpinnerStrokeWidth = 6;

class GlobalMicSlider extends StatefulWidget {
  const GlobalMicSlider({
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
  State<GlobalMicSlider> createState() => _GlobalMicSliderState();
}

class _GlobalMicSliderState extends State<GlobalMicSlider>
    with SingleTickerProviderStateMixin {
  double _value = 0.0;
  bool _isDragging = false;
  AudioRecorderState? _currentState;
  bool _holdingRecording = false;
  late final AnimationController _spinnerController;

  @override
  void initState() {
    super.initState();
    _spinnerController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _spinnerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AudioRecorderState>(
      stream: widget.stateStream,
      initialData: widget.initialState,
      builder: (context, snapshot) {
        _currentState = snapshot.data ?? widget.initialState;
        final state = _currentState ?? AudioRecorderState.idle();
        final colors = Theme.of(context).colorScheme;
        final streamingState = _isStreamingStatus(state.status);

        if (!_isDragging) {
          _value = streamingState ? 1.0 : 0.0;
        }

        final presentation = _mapPresentation(state, colors);

        // Update spinner animation state after frame is built
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;

          if (presentation.showSpinner) {
            if (!_spinnerController.isAnimating) {
              _spinnerController.repeat();
            }
          } else {
            if (_spinnerController.isAnimating) {
              _spinnerController.stop();
              _spinnerController.value = 0;
            }
          }
        });

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                if (streamingState) {
                  widget.onTurnOffStreaming();
                  setState(() => _value = 0.0);
                } else {
                  widget.onTurnOnStreaming();
                  setState(() => _value = 1.0);
                }
              },
              child: Icon(
                Icons.wifi_tethering,
                color:
                    streamingState ? colors.primary : colors.onSurfaceVariant,
                size: _kStreamingIconSize,
              ),
            ),
            const SizedBox(height: _kHintSpacing),
            SizedBox(
              width: _kSliderWidth,
              height: _kTrackHeight + _kThumbDiameter / 2,
              child: RotatedBox(
                quarterTurns: -1,
                child: AnimatedBuilder(
                  animation: _spinnerController,
                  builder: (context, child) {
                    return SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: _kTrackThickness,
                        activeTrackColor: colors.primary,
                        inactiveTrackColor:
                            colors.surfaceVariant.withOpacity(0.6),
                        trackShape: const _FullTrackShape(),
                        thumbShape: _MicThumbShape(
                            presentation, _spinnerController.value),
                        overlayShape: SliderComponentShape.noOverlay,
                      ),
                      child: child!,
                    );
                  },
                  child: Listener(
                    onPointerDown: (_) => _handlePointerDown(state),
                    onPointerUp: (_) => _handlePointerUp(state),
                    child: Slider(
                      value: _value,
                      min: 0,
                      max: 1,
                      onChangeStart: (_) {
                        setState(() => _isDragging = true);
                      },
                      onChanged: (value) {
                        setState(() => _value = value.clamp(0.0, 1.0));
                      },
                      onChangeEnd: (value) {
                        setState(() => _isDragging = false);
                        _handleSliderEnd(value, state);
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: _kTextSpacing),
            Text(
              presentation.primaryText,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            if (presentation.secondaryText != null) ...[
              const SizedBox(height: _kHintSpacing),
              Text(
                presentation.secondaryText!,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
            if (!streamingState)
              Padding(
                padding: const EdgeInsets.only(top: _kTextSpacing),
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
                padding: const EdgeInsets.only(top: _kTextSpacing),
                child: Text(
                  'Tap mic to stop streaming',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: colors.onSurfaceVariant),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        );
      },
    );
  }

  void _handlePointerDown(AudioRecorderState state) {
    if (state.status == AudioRecorderStatus.error) {
      widget.onRetry();
      return;
    }
    if (_isStreamingStatus(state.status)) {
      _holdingRecording = false;
      return;
    }
    _holdingRecording = true;
    widget.onTurnOnRecording();
  }

  void _handlePointerUp(AudioRecorderState state) {
    if (_holdingRecording) {
      widget.onTurnOffRecording();
      _holdingRecording = false;
    }
  }

  void _handleSliderEnd(double value, AudioRecorderState state) {
    if (value >= 0.6) {
      _value = 1.0;
      widget.onTurnOnStreaming();
    } else {
      _value = 0.0;
      if (_isStreamingStatus(state.status)) {
        widget.onTurnOffStreaming();
      }
    }
    if (_holdingRecording) {
      widget.onTurnOffRecording();
      _holdingRecording = false;
    }
    setState(() {});
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
  });

  const _ButtonPresentation.loading({
    required Color background,
    required String primaryText,
  }) : this(
          background: background,
          icon: Icons.hourglass_empty,
          iconColor: Colors.white,
          primaryText: primaryText,
          showSpinner: true,
        );

  final Color background;
  final IconData icon;
  final Color iconColor;
  final String primaryText;
  final String? secondaryText;
  final bool showSpinner;
}

class _MicThumbShape extends SliderComponentShape {
  const _MicThumbShape(this.presentation, this.spinnerProgress);

  final _ButtonPresentation presentation;
  final double spinnerProgress;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size.square(_kThumbDiameter);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;
    final paint = Paint()..color = presentation.background;
    canvas.drawCircle(center, _kThumbDiameter / 2, paint);

    if (presentation.showSpinner) {
      final spinnerPaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = _kSpinnerStrokeWidth
        ..strokeCap = StrokeCap.round
        ..color = Colors.white.withOpacity(0.85);
      final rect = Rect.fromCircle(
        center: center,
        radius: (_kThumbDiameter / 2) - _kSpinnerStrokeWidth,
      );
      final startAngle = spinnerProgress * 2 * math.pi;
      canvas.drawArc(rect, startAngle, math.pi * 1.5, false, spinnerPaint);
    }

    final cacheKey =
        '${presentation.icon.codePoint}-${presentation.iconColor.value}';
    final iconPainter = _iconPainterCache[cacheKey] ??=
        _buildIconPainter(presentation.icon, presentation.iconColor);
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(math.pi / 2);
    iconPainter.paint(
      canvas,
      Offset(-iconPainter.width / 2, -iconPainter.height / 2),
    );
    canvas.restore();
  }

  static final Map<String, _IconPainter> _iconPainterCache = {};

  _IconPainter _buildIconPainter(IconData icon, Color color) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          fontSize: _kThumbIconSize,
          fontFamily: icon.fontFamily,
          package: icon.fontPackage,
          color: color,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    return _IconPainter(textPainter);
  }
}

class _FullTrackShape extends RoundedRectSliderTrackShape {
  const _FullTrackShape();

  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isDiscrete = false,
    bool isEnabled = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight ?? 2;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

class _IconPainter {
  const _IconPainter(this.painter);

  final TextPainter painter;

  double get width => painter.width;
  double get height => painter.height;

  void paint(Canvas canvas, Offset offset) => painter.paint(canvas, offset);
}
