# Voice Assistant Audio Recorder State Spec

## Purpose
- Centralize microphone session state management inside `AudioRecorder` so UI components only react to emitted states.
- Support two capture flows—buffered file recording and low-latency streaming—and allow seamless transition from one to the other via mic control gestures.
- Provide structured feedback (including raw error descriptions) for the voice assistant mic button and related UI elements.
- Redefine the mic control as the primary app entry point so the voice assistant layer stays active across the entire application lifecycle, independent of individual chat screens.

## Audio Recorder State Model
- **State Object Fields**
  - `status`: categorical value representing the recorder lifecycle (see list below).
  - `mode`: `none | buffered | streaming`; indicates the active capture modality.
  - `message`: optional human-readable detail (display the raw error text when `status = error`).
  - `timestamp`: ISO-8601 string of when the state was emitted (for debugging/analytics).
- **Status Values**
  - `idle`: recorder is ready, no active session.
  - `preparingBuffered`: recorder is acquiring permissions, configuring encoders, or opening buffers for a file capture.
  - `recordingBuffered`: recorder is actively collecting audio for a buffered file.
  - `finalizingBuffered`: recorder is stopping capture, packaging audio, and pushing it to the assistant service.
  - `preparingStreaming`: recorder is initializing the streaming pipeline and awaiting confirmation that chunks are flowing.
  - `streamingActive`: live PCM streaming is in progress.
  - `finalizingStreaming`: recorder is stopping the stream and detaching listeners.
  - `error`: unrecoverable failure; `message` contains the raw description from the underlying library.
- **Derived Helpers**
  - `isBusy`: `status` is any value except `idle` and `error`.
  - `isActiveCapture`: `status` is `recordingBuffered` or `streamingActive`.

## Interface Additions
- Extend `AudioRecorder` with:
  - `Stream<AudioRecorderState> get stateStream;` (broadcast stream emitting the full state object; initial emission is `idle`).
  - `AudioRecorderState get currentState;` (latest cached state for synchronous reads).
- State transitions occur wholly inside the concrete implementations (`RealAudioRecorder`, `MockAudioRecorder`). Public start/stop methods trigger the transitions but callers never mutate state directly.
- Error handling: any caught exception funnels through a shared handler that emits `error` with the raw message before rethrowing a domain-specific exception when needed.

## Default Transition Flows
- **Buffered Capture Flow**
  1. `idle` → `preparingBuffered` when `startRecording()` is invoked.
  2. `preparingBuffered` → `recordingBuffered` once the recorder confirms microphone acquisition.
  3. `recordingBuffered` → `finalizingBuffered` immediately after `stopRecording()` begins cleanup.
  4. `finalizingBuffered` → `idle` after audio bytes are delivered to consumers; emit `error` on failure instead.
- **Streaming Flow**
  1. `idle` or `recordingBuffered` → `preparingStreaming` when `startStreaming()` is triggered (swipe-up gesture).
  2. `preparingStreaming` → `streamingActive` after the first chunk listener is attached.
  3. `streamingActive` → `finalizingStreaming` when `stopStreaming()` is invoked.
  4. `finalizingStreaming` → `idle` after subscriptions close; emit `error` on failure instead.
- **Mode Flip**
  - If the user transitions from buffered to streaming mid-hold, emit `finalizingBuffered` while tearing down the buffered session, followed by `preparingStreaming` and the rest of the streaming flow.

## UI Contract (Mic Button Controller)
- **Base States**
  - `idle`: mic button neutral gray; tooltip “Hold to record”.
  - `error`: button pulses red; display raw `message` in toast/banner until user releases or retries.
- **Hold-to-Record Behavior**
  - On press-down: immediately show “Preparing…” label and spinner; UI listens for `preparingBuffered`.
  - Transition to solid recording color with pulsing inner circle when state becomes `recordingBuffered`.
  - On release: button locks in place with “Processing…” label while `finalizingBuffered` is active.
  - When state returns to `idle`, reset visual to neutral gray and clear messaging.
- **Swipe-Up Streaming Behavior**
  - While holding, show hint text “Swipe up for streaming”.
  - On upward swipe:
    - Trigger `startStreaming()`; animate button flip (coin effect) and switch iconography.
    - During `preparingStreaming`, display spinner orbiting the flipped button face.
    - When `streamingActive` arrives, swap spinner for a continuous ripple effect.
  - After the user releases in streaming mode, treat `finalizingStreaming` similar to buffered processing (maintain flipped side until state returns to `idle`).
- **Global Placement**
  - The mic button becomes part of the root application scaffold (e.g., floating at bottom center or integrated into a persistent control bar).
  - Chat panels focus exclusively on text messages and history; they no longer host mic-specific controls.
  - The recorder service initializes with the app shell and remains active for the entire session (listeners inside chat view subscribe/unsubscribe without owning the controller).
  - The voice assistant service mirrors this lifecycle: it initializes alongside the app shell, keeps its connection warm, and exposes state/streams that chat panels or other surfaces can bind to on demand.
  - Default UI surfaces only the mic controller; opening the chat panel expands the interface to show text conversation on demand.

## Error Display Rules
- Any `error` emission stops other animations; the mic button switches to a static red icon and shows the raw `message` text from the recorder.
- UI stays in error visuals until the user tap-holds again, at which point the recorder attempts to transition to `preparingBuffered` or `preparingStreaming` and the UI should resume the normal flow.

## Implementation Notes
- `stateStream` should be a broadcast controller shared across listeners (Chat UI, analytics, logging).
- `currentState` updates atomically with every emitted state to avoid stale reads in business logic.
- Both recorder implementations must reset to `idle` during `dispose()` and close the state stream with a final `idle` emission so listeners can detach cleanly.
