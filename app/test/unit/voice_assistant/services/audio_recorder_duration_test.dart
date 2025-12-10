import 'package:flutter_test/flutter_test.dart';
import 'package:meditation_companion/features/voice_assistant/services/audio_recorder.dart';
import 'package:meditation_companion/features/voice_assistant/services/mock_audio_recorder.dart';

void main() {
  group('MockAudioRecorder duration tracking', () {
    late MockAudioRecorder recorder;

    setUp(() {
      recorder = MockAudioRecorder();
    });

    tearDown(() async {
      await recorder.dispose();
    });

    test('emits duration updates during buffered recording', () async {
      final states = <AudioRecorderState>[];
      final subscription = recorder.stateStream.listen(states.add);

      await recorder.startRecording();

      // Wait for at least 3 duration updates (300ms)
      await Future.delayed(const Duration(milliseconds: 350));

      await recorder.stopRecording();

      // Verify we got duration updates
      final recordingStates = states
          .where(
            (s) => s.status == AudioRecorderStatus.recordingBuffered,
          )
          .toList();

      expect(recordingStates.length, greaterThan(2),
          reason: 'Should emit multiple duration updates');

      // Verify duration is increasing
      for (int i = 1; i < recordingStates.length; i++) {
        final prev = recordingStates[i - 1].recordingDuration;
        final curr = recordingStates[i].recordingDuration;
        expect(curr, isNotNull);
        expect(prev, isNotNull);
        expect(curr!, greaterThan(prev!));
      }

      await subscription.cancel();
    });

    test('emits duration updates during streaming', () async {
      final states = <AudioRecorderState>[];
      final subscription = recorder.stateStream.listen(states.add);

      await recorder.startStreaming();

      // Wait for at least 3 duration updates (300ms)
      await Future.delayed(const Duration(milliseconds: 350));

      await recorder.stopStreaming();

      // Verify we got duration updates
      final streamingStates = states
          .where(
            (s) => s.status == AudioRecorderStatus.streamingActive,
          )
          .toList();

      expect(streamingStates.length, greaterThan(2),
          reason: 'Should emit multiple duration updates');

      // Verify duration is increasing
      for (int i = 1; i < streamingStates.length; i++) {
        final prev = streamingStates[i - 1].recordingDuration;
        final curr = streamingStates[i].recordingDuration;
        expect(curr, isNotNull);
        expect(prev, isNotNull);
        expect(curr!, greaterThan(prev!));
      }

      await subscription.cancel();
    });

    test('emits recordedData in final state before idle', () async {
      final states = <AudioRecorderState>[];
      final subscription = recorder.stateStream.listen(states.add);

      await recorder.startRecording();
      await Future.delayed(const Duration(milliseconds: 150));
      await recorder.stopRecording();

      // Wait for idle state to be emitted
      await Future.delayed(const Duration(milliseconds: 50));

      // Find state with recordedData
      final stateWithData = states.firstWhere(
        (s) => s.recordedData != null,
        orElse: () => throw StateError('No state with recordedData found'),
      );

      expect(stateWithData.recordedData, isNotNull);
      expect(stateWithData.recordingDuration, isNotNull);

      // Verify idle state comes after
      final lastState = states.last;
      expect(lastState.status, AudioRecorderStatus.idle);
      expect(lastState.recordedData, isNull);

      await subscription.cancel();
    });

    test('stops duration updates after stopRecording', () async {
      final states = <AudioRecorderState>[];
      final subscription = recorder.stateStream.listen(states.add);

      await recorder.startRecording();
      await Future.delayed(const Duration(milliseconds: 150));
      final stoppedData = await recorder.stopRecording();

      expect(stoppedData, isNotNull);

      final stateCountBefore = states.length;

      // Wait to ensure no more duration updates are emitted
      await Future.delayed(const Duration(milliseconds: 200));

      final stateCountAfter = states.length;

      // Should only have idle state added, no more duration updates
      expect(stateCountAfter - stateCountBefore, lessThanOrEqualTo(2),
          reason: 'Should not emit duration updates after stopping');

      await subscription.cancel();
    });
  });
}
