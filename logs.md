# Новый тест с исправлением timestamp в ChatConnected состоянии
Restarted application in 563ms.
flutter_soloud.SoLoud: WARNING: init() called when the native player is already initialized. This is expected after a hot restart but not otherwise. If you see this in production logs, there's probably a bug in your code. You may have neglected to deinit() SoLoud during the current lifetime of the app.
CPP bool createWorkerInWasm()
EM_ASM web worker already created!
[Voice Assistant/Voice Assistant Repository Lifecycle] VoiceAssistantRepository - Constructor initialized at 2025-10-05T13:39:23.133
[Voice Assistant/Voice Assistant Repository Lifecycle] VoiceAssistantRepository - Client connected: false
[Chat/Chat Assistant Widget Lifecycle] ChatAssistantWidget - Creating ChatBloc with VoiceAssistantRepository at 2025-10-05T13:39:23.137
[Chat/ChatBloc Lifecycle] ChatBloc - Constructor initialized at 2025-10-05T13:39:23.204
[Chat/ChatBloc Lifecycle] ChatBloc - Event handlers registered at 2025-10-05T13:39:23.205
[Chat/Chat Assistant Widget Lifecycle] ChatAssistantWidget - ChatBloc created, sending ChatStreamConnected event
[Chat/Chat Assistant Widget Lifecycle] ChatAssistantWidget - Setting up ChatBloc stream listener
[Chat/Chat Assistant Widget Lifecycle] ChatAssistantWidget - ChatBloc setup completed
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatInitial at 2025-10-05T13:39:23.283
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 0 messages at 2025-10-05T13:39:23.300
[Chat/ChatBloc Stream] ChatBloc - ChatStreamConnected event received at 2025-10-05T13:39:23.355
[Chat/ChatBloc Stream] ChatBloc - Setting up message stream...
[Chat/ChatBloc Stream] ChatBloc - _setupMessageStream called at 2025-10-05T13:39:23.355
[Chat/ChatBloc Stream] ChatBloc - Previous subscription cancelled (if any)
[Voice Assistant/Voice Assistant Repository Stream] VoiceAssistantRepository - getMessageStream called at 2025-10-05T13:39:23.356
[Voice Assistant/Voice Assistant Repository Stream] VoiceAssistantRepository - Stream controller is closed: false
[Chat/ChatBloc Stream] ChatBloc - Message stream subscription created at 2025-10-05T13:39:23.356
[Chat/ChatBloc Stream] ChatBloc - Message stream setup completed at 2025-10-05T13:39:23.357
[Chat/ChatBloc Lifecycle] ChatBloc - Retrieved 0 existing messages from repository
[Chat/ChatBloc Lifecycle] ChatBloc - Added messages to local list, total count: 0
[Chat/ChatBloc UI] ChatBloc - Emitted ChatConnected state with 0 messages at 2025-10-05T13:39:23.359
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:39:23.359
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 0 messages
[Chat/Chat Assistant State] ChatAssistantWidget - Adding welcome message
[Chat/Chat Assistant State] ChatAssistantWidget - Welcome message added
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=welcome-1759657163360, content="Hello! I'm your meditation ass...", isUser=false, status=completed at 2025-10-05T13:39:23.361
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=welcome-1759657163360 in 0 existing messages
[Chat/ChatBloc Message Processing] ChatBloc - NOT FOUND: Adding new message to list
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 1
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 1 messages at 2025-10-05T13:39:23.361
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:39:23.361
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 1 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:39:23.368
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 1 messages at 2025-10-05T13:39:23.370
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
openai_realtime_dart.api: INFO: Connected to "wss://api.openai.com/v1/realtime"
[Chat/Chat Assistant OpenAI] Connected to OpenAI Realtime: true
[Voice Assistant/AssistantBloc Mode] Streaming mode set to true
[Voice Assistant/AssistantBloc Streaming] Auto-starting streaming after toggle
[Voice Assistant/AssistantBloc Recording] Start recording requested; streaming=true canRecord=true
[Voice Assistant/AssistantBloc Streaming] Starting streaming recorder
[Voice Assistant/Audio Recorder] RealAudioRecorder: startStreaming()
[Voice Assistant/Audio Recorder] RealAudioRecorder: recorder.startStream resolved (mode=_RecorderMode.streaming)
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=user text="<empty>" transcriptLen=0 transcript="<empty>" audioBytes=25632 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository User Message] VoiceAssistantRepository - _upsertUserMessage START: messageId=item_CNFW5OvDTRv0zYqGICBxM, transcript="", deltaTranscript="<null>", markCompleted=false at 2025-10-05T13:40:26.031
[Voice Assistant/Voice Assistant Repository User Message] VoiceAssistantRepository - MESSAGE TYPE CHECK: Is this voice message (should create by ID) or text message (should find awaiting)?
[Voice Assistant/Voice Assistant Repository User Message] VoiceAssistantRepository - No transcript text provided, skipping user message upsert
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation item appended role=user text="<empty>" transcriptLen=0 transcript="<empty>" audioBytes=25632 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository User Message] VoiceAssistantRepository - _upsertUserMessage START: messageId=item_CNFW5OvDTRv0zYqGICBxM, transcript="", deltaTranscript="<null>", markCompleted=false at 2025-10-05T13:40:26.032
[Voice Assistant/Voice Assistant Repository User Message] VoiceAssistantRepository - MESSAGE TYPE CHECK: Is this voice message (should create by ID) or text message (should find awaiting)?
[Voice Assistant/Voice Assistant Repository User Message] VoiceAssistantRepository - No transcript text provided, skipping user message upsert
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation item completed role=user text="<empty>" transcriptLen=0 transcript="<empty>" audioBytes=25632 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository User Message] VoiceAssistantRepository - _upsertUserMessage START: messageId=item_CNFW5OvDTRv0zYqGICBxM, transcript="", deltaTranscript="<null>", markCompleted=true at 2025-10-05T13:40:26.033
[Voice Assistant/Voice Assistant Repository User Message] VoiceAssistantRepository - MESSAGE TYPE CHECK: Is this voice message (should create by ID) or text message (should find awaiting)?
[Voice Assistant/Voice Assistant Repository User Message] VoiceAssistantRepository - No transcript text provided, skipping user message upsert
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=0 transcript="<empty>" audioBytes=0 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="<null>", appendText="<null>", markCompleted=false at 2025-10-05T13:40:26.357
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation item appended role=assistant text="<empty>" transcriptLen=0 transcript="<empty>" audioBytes=0 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="<null>", appendText="<null>", markCompleted=false at 2025-10-05T13:40:26.357
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=2 transcript="Sí" audioBytes=0 deltaTextLen=0 deltaTranscriptLen=2 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí", appendText="Sí", markCompleted=false at 2025-10-05T13:40:26.370
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Creating new assistant message: content="Sí", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Added new assistant message to list (index=0)
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí", isUser=false, status=streaming at 2025-10-05T13:40:26.371
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí", isUser=false, status=streaming at 2025-10-05T13:40:26.371
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 1 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc Message Processing] ChatBloc - NOT FOUND: Adding new message to list
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 2
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 2 messages at 2025-10-05T13:40:26.372
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:26.373
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 2 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:26.381
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 2 messages at 2025-10-05T13:40:26.383
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=3 transcript="Sí," audioBytes=0 deltaTextLen=0 deltaTranscriptLen=1 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí,", appendText=",", markCompleted=false at 2025-10-05T13:40:26.414
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí" -> new content="Sí,,", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí,,", isUser=false, status=streaming at 2025-10-05T13:40:26.415
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí,,", isUser=false, status=streaming at 2025-10-05T13:40:26.415
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 2 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí" -> "Sí,,"
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 2
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 2 messages at 2025-10-05T13:40:26.416
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:26.416
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 2 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:26.420
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 2 messages at 2025-10-05T13:40:26.422
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí,,", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=6 transcript="Sí, te" audioBytes=0 deltaTextLen=0 deltaTranscriptLen=3 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te", appendText=" te", markCompleted=false at 2025-10-05T13:40:26.437
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí,," -> new content="Sí, te te", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te te", isUser=false, status=streaming at 2025-10-05T13:40:26.437
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te te", isUser=false, status=streaming at 2025-10-05T13:40:26.437
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 2 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí,,"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí,," -> "Sí, te te"
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 2
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 2 messages at 2025-10-05T13:40:26.438
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:26.438
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 2 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=13 transcript="Sí, te escuch" audioBytes=0 deltaTextLen=0 deltaTranscriptLen=7 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escuch", appendText=" escuch", markCompleted=false at 2025-10-05T13:40:26.440
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te te" -> new content="Sí, te escuch escuch", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escuch escuch", isUser=false, status=streaming at 2025-10-05T13:40:26.440
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escuch escuch", isUser=false, status=streaming at 2025-10-05T13:40:26.440
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 2 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te te"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te te" -> "Sí, te escuch escuch"
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 2
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 2 messages at 2025-10-05T13:40:26.441
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:26.441
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 2 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:26.458
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 2 messages at 2025-10-05T13:40:26.459
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escuch escuch", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=13 transcript="Sí, te escuch" audioBytes=4800 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=4800
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escuch", appendText="<null>", markCompleted=false at 2025-10-05T13:40:26.530
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escuch escuch" -> new content="Sí, te escuch", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFW5pxn31WpIYBFLqyzC chunkBytes=4800
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escuch", isUser=false, status=streaming at 2025-10-05T13:40:26.531
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escuch", isUser=false, status=streaming at 2025-10-05T13:40:26.531
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 2 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escuch escuch"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escuch escuch" -> "Sí, te escuch"
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 2
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 2 messages at 2025-10-05T13:40:26.532
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:26.533
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 2 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:26.535
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 2 messages at 2025-10-05T13:40:26.536
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escuch", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=13 transcript="Sí, te escuch" audioBytes=12000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=7200
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escuch", appendText="<null>", markCompleted=false at 2025-10-05T13:40:26.548
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escuch" -> new content="Sí, te escuch", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFW5pxn31WpIYBFLqyzC chunkBytes=7200
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escuch", isUser=false, status=streaming at 2025-10-05T13:40:26.549
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escuch", isUser=false, status=streaming at 2025-10-05T13:40:26.549
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 2 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escuch"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escuch" -> "Sí, te escuch"
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 2
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 2 messages at 2025-10-05T13:40:26.549
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:26.550
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 2 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:26.552
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 2 messages at 2025-10-05T13:40:26.552
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escuch", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=13 transcript="Sí, te escuch" audioBytes=24000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escuch", appendText="<null>", markCompleted=false at 2025-10-05T13:40:26.578
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escuch" -> new content="Sí, te escuch", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFW5pxn31WpIYBFLqyzC chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escuch", isUser=false, status=streaming at 2025-10-05T13:40:26.579
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escuch", isUser=false, status=streaming at 2025-10-05T13:40:26.579
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 2 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escuch"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escuch" -> "Sí, te escuch"
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 2
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 2 messages at 2025-10-05T13:40:26.580
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:26.580
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 2 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=14 transcript="Sí, te escucho" audioBytes=24000 deltaTextLen=0 deltaTranscriptLen=1 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escucho", appendText="o", markCompleted=false at 2025-10-05T13:40:26.582
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escuch" -> new content="Sí, te escuchoo", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escuchoo", isUser=false, status=streaming at 2025-10-05T13:40:26.583
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escuchoo", isUser=false, status=streaming at 2025-10-05T13:40:26.583
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 2 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escuch"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escuch" -> "Sí, te escuchoo"
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 2
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 2 messages at 2025-10-05T13:40:26.583
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:26.583
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 2 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=28 transcript="Sí, te escucho perfectamente" audioBytes=24000 deltaTextLen=0 deltaTranscriptLen=14 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escucho perfectamente", appendText=" perfectamente", markCompleted=false at 2025-10-05T13:40:26.585
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escuchoo" -> new content="Sí, te escucho perfectamente p...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente perfectamente", isUser=false, status=streaming at 2025-10-05T13:40:26.585
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente p...", isUser=false, status=streaming at 2025-10-05T13:40:26.585
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 2 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escuchoo"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escuchoo" -> "Sí, te escucho perfectamente p..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 2
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 2 messages at 2025-10-05T13:40:26.586
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:26.586
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 2 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=29 transcript="Sí, te escucho perfectamente." audioBytes=24000 deltaTextLen=0 deltaTranscriptLen=1 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escucho perfectamente.", appendText=".", markCompleted=false at 2025-10-05T13:40:26.588
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escucho perfectamente p..." -> new content="Sí, te escucho perfectamente..", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente..", isUser=false, status=streaming at 2025-10-05T13:40:26.588
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente..", isUser=false, status=streaming at 2025-10-05T13:40:26.588
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 2 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escucho perfectamente p..." -> "Sí, te escucho perfectamente.."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 2
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 2 messages at 2025-10-05T13:40:26.589
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:26.589
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 2 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:26.598
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 2 messages at 2025-10-05T13:40:26.598
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente..", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=29 transcript="Sí, te escucho perfectamente." audioBytes=36000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escucho perfectamente.", appendText="<null>", markCompleted=false at 2025-10-05T13:40:26.706
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escucho perfectamente.." -> new content="Sí, te escucho perfectamente.", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFW5pxn31WpIYBFLqyzC chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente.", isUser=false, status=streaming at 2025-10-05T13:40:26.707
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente.", isUser=false, status=streaming at 2025-10-05T13:40:26.708
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 2 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escucho perfectamente.." -> "Sí, te escucho perfectamente."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 2
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 2 messages at 2025-10-05T13:40:26.708
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:26.709
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 2 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:26.711
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 2 messages at 2025-10-05T13:40:26.712
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente.", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=29 transcript="Sí, te escucho perfectamente." audioBytes=48000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escucho perfectamente.", appendText="<null>", markCompleted=false at 2025-10-05T13:40:26.721
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escucho perfectamente." -> new content="Sí, te escucho perfectamente.", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFW5pxn31WpIYBFLqyzC chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente.", isUser=false, status=streaming at 2025-10-05T13:40:26.722
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente.", isUser=false, status=streaming at 2025-10-05T13:40:26.722
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 2 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escucho perfectamente." -> "Sí, te escucho perfectamente."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 2
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 2 messages at 2025-10-05T13:40:26.723
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:26.723
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 2 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:26.733
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 2 messages at 2025-10-05T13:40:26.734
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente.", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=29 transcript="Sí, te escucho perfectamente." audioBytes=60000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escucho perfectamente.", appendText="<null>", markCompleted=false at 2025-10-05T13:40:26.742
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escucho perfectamente." -> new content="Sí, te escucho perfectamente.", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFW5pxn31WpIYBFLqyzC chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente.", isUser=false, status=streaming at 2025-10-05T13:40:26.743
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente.", isUser=false, status=streaming at 2025-10-05T13:40:26.743
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 2 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escucho perfectamente." -> "Sí, te escucho perfectamente."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 2
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 2 messages at 2025-10-05T13:40:26.744
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:26.745
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 2 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:26.748
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 2 messages at 2025-10-05T13:40:26.748
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente.", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=29 transcript="Sí, te escucho perfectamente." audioBytes=72000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escucho perfectamente.", appendText="<null>", markCompleted=false at 2025-10-05T13:40:26.839
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escucho perfectamente." -> new content="Sí, te escucho perfectamente.", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFW5pxn31WpIYBFLqyzC chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente.", isUser=false, status=streaming at 2025-10-05T13:40:26.840
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente.", isUser=false, status=streaming at 2025-10-05T13:40:26.840
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 2 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escucho perfectamente." -> "Sí, te escucho perfectamente."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 2
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 2 messages at 2025-10-05T13:40:26.841
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:26.842
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 2 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:26.843
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 2 messages at 2025-10-05T13:40:26.844
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente.", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=29 transcript="Sí, te escucho perfectamente." audioBytes=84000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escucho perfectamente.", appendText="<null>", markCompleted=false at 2025-10-05T13:40:26.851
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escucho perfectamente." -> new content="Sí, te escucho perfectamente.", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFW5pxn31WpIYBFLqyzC chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente.", isUser=false, status=streaming at 2025-10-05T13:40:26.852
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente.", isUser=false, status=streaming at 2025-10-05T13:40:26.853
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 2 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escucho perfectamente." -> "Sí, te escucho perfectamente."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 2
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 2 messages at 2025-10-05T13:40:26.853
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:26.854
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 2 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=31 transcript="Sí, te escucho perfectamente. ¿" audioBytes=84000 deltaTextLen=0 deltaTranscriptLen=2 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escucho perfectamente. ¿", appendText=" ¿", markCompleted=false at 2025-10-05T13:40:26.859
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escucho perfectamente." -> new content="Sí, te escucho perfectamente. ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ¿ ¿", isUser=false, status=streaming at 2025-10-05T13:40:26.860
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ...", isUser=false, status=streaming at 2025-10-05T13:40:26.860
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 2 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escucho perfectamente." -> "Sí, te escucho perfectamente. ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 2
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 2 messages at 2025-10-05T13:40:26.860
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:26.861
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 2 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=35 transcript="Sí, te escucho perfectamente. ¿Cómo" audioBytes=84000 deltaTextLen=0 deltaTranscriptLen=4 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escucho perfectamente. ¿Cómo", appendText="Cómo", markCompleted=false at 2025-10-05T13:40:26.862
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escucho perfectamente. ..." -> new content="Sí, te escucho perfectamente. ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ¿CómoCómo", isUser=false, status=streaming at 2025-10-05T13:40:26.862
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ...", isUser=false, status=streaming at 2025-10-05T13:40:26.862
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 2 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escucho perfectamente. ..." -> "Sí, te escucho perfectamente. ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 2
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 2 messages at 2025-10-05T13:40:26.863
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:26.863
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 2 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=38 transcript="Sí, te escucho perfectamente. ¿Cómo te" audioBytes=84000 deltaTextLen=0 deltaTranscriptLen=3 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escucho perfectamente. ¿Cómo te", appendText=" te", markCompleted=false at 2025-10-05T13:40:26.864
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escucho perfectamente. ..." -> new content="Sí, te escucho perfectamente. ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ¿Cómo te te", isUser=false, status=streaming at 2025-10-05T13:40:26.864
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ...", isUser=false, status=streaming at 2025-10-05T13:40:26.864
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 2 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escucho perfectamente. ..." -> "Sí, te escucho perfectamente. ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 2
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 2 messages at 2025-10-05T13:40:26.865
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:26.865
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 2 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=47 transcript="Sí, te escucho perfectamente. ¿Cómo te gustaría" audioBytes=84000 deltaTextLen=0 deltaTranscriptLen=9 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escucho perfectamente. ¿Cómo te gustaría", appendText=" gustaría", markCompleted=false at 2025-10-05T13:40:26.866
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escucho perfectamente. ..." -> new content="Sí, te escucho perfectamente. ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ¿Cómo te gustaría gu...", isUser=false, status=streaming at 2025-10-05T13:40:26.867
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ...", isUser=false, status=streaming at 2025-10-05T13:40:26.867
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 2 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escucho perfectamente. ..." -> "Sí, te escucho perfectamente. ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 2
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 2 messages at 2025-10-05T13:40:26.867
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:26.867
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 2 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=55 transcript="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar" audioBytes=84000 deltaTextLen=0 deltaTranscriptLen=8 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar", appendText=" empezar", markCompleted=false at 2025-10-05T13:40:26.868
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escucho perfectamente. ..." -> new content="Sí, te escucho perfectamente. ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ¿Cómo te gustaría em...", isUser=false, status=streaming at 2025-10-05T13:40:26.869
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ...", isUser=false, status=streaming at 2025-10-05T13:40:26.869
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 2 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escucho perfectamente. ..." -> "Sí, te escucho perfectamente. ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 2
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 2 messages at 2025-10-05T13:40:26.869
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:26.869
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 2 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=59 transcript="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con" audioBytes=84000 deltaTextLen=0 deltaTranscriptLen=4 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con", appendText=" con", markCompleted=false at 2025-10-05T13:40:26.870
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escucho perfectamente. ..." -> new content="Sí, te escucho perfectamente. ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ¿Cómo te gustaría em...", isUser=false, status=streaming at 2025-10-05T13:40:26.870
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ...", isUser=false, status=streaming at 2025-10-05T13:40:26.870
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 2 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escucho perfectamente. ..." -> "Sí, te escucho perfectamente. ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 2
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 2 messages at 2025-10-05T13:40:26.871
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:26.871
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 2 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=62 transcript="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu" audioBytes=84000 deltaTextLen=0 deltaTranscriptLen=3 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu", appendText=" tu", markCompleted=false at 2025-10-05T13:40:26.872
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escucho perfectamente. ..." -> new content="Sí, te escucho perfectamente. ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ¿Cómo te gustaría em...", isUser=false, status=streaming at 2025-10-05T13:40:26.872
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ...", isUser=false, status=streaming at 2025-10-05T13:40:26.872
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 2 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escucho perfectamente. ..." -> "Sí, te escucho perfectamente. ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 2
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 2 messages at 2025-10-05T13:40:26.873
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:26.873
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 2 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:26.874
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 2 messages at 2025-10-05T13:40:26.875
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=62 transcript="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu" audioBytes=96000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu", appendText="<null>", markCompleted=false at 2025-10-05T13:40:26.923
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escucho perfectamente. ..." -> new content="Sí, te escucho perfectamente. ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFW5pxn31WpIYBFLqyzC chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ¿Cómo te gustaría em...", isUser=false, status=streaming at 2025-10-05T13:40:26.924
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ...", isUser=false, status=streaming at 2025-10-05T13:40:26.924
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 2 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escucho perfectamente. ..." -> "Sí, te escucho perfectamente. ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 2
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 2 messages at 2025-10-05T13:40:26.925
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:26.925
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 2 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:26.932
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 2 messages at 2025-10-05T13:40:26.933
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=user text="<empty>" transcriptLen=15 transcript="Do you hear me?" audioBytes=25632 deltaTextLen=0 deltaTranscriptLen=15 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository User Message] VoiceAssistantRepository - _upsertUserMessage START: messageId=item_CNFW5OvDTRv0zYqGICBxM, transcript="Do you hear me?", deltaTranscript="Do you hear me?", markCompleted=false at 2025-10-05T13:40:26.952
[Voice Assistant/Voice Assistant Repository User Message] VoiceAssistantRepository - MESSAGE TYPE CHECK: Is this voice message (should create by ID) or text message (should find awaiting)?
[Voice Assistant/Voice Assistant Repository User Message] VoiceAssistantRepository - Looking for existing user message with transcript: "Do you hear me?"
[Voice Assistant/Voice Assistant Repository User Message] VoiceAssistantRepository - Current _inProgressUserMessages count: 0
[Voice Assistant/Voice Assistant Repository User Message] VoiceAssistantRepository - VOICE MESSAGE CREATION: No existing user message found, creating new voice message from API transcript
[Voice Assistant/Voice Assistant Repository User Message] VoiceAssistantRepository - VOICE MESSAGE CREATED: id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?", status=streaming at 2025-10-05T13:40:26.953
[Voice Assistant/Voice Assistant Repository User Message] VoiceAssistantRepository - VOICE MESSAGE ADDED TO _messages: index=1, total messages=2
[Voice Assistant/Voice Assistant Repository User Message] VoiceAssistantRepository - VOICE MESSAGE STREAM EMIT: About to emit to _messagesController at 2025-10-05T13:40:26.953
[Voice Assistant/Voice Assistant Repository User Message] VoiceAssistantRepository - VOICE MESSAGE STREAM EMITTED: Message sent to stream, controller closed=false
[Voice Assistant/Voice Assistant Repository User Message] VoiceAssistantRepository - Stored new user message in _inProgressUserMessages with key="Do you hear me?"
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?", isUser=true, status=streaming at 2025-10-05T13:40:26.953
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?", isUser=true, status=streaming at 2025-10-05T13:40:26.953
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process USER message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5OvDTRv0zYqGICBxM in 2 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc Message Processing] ChatBloc - NOT FOUND: Adding new message to list
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 3
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 3 messages at 2025-10-05T13:40:26.953
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:26.954
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 3 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:26.955
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 3 messages at 2025-10-05T13:40:26.955
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=62 transcript="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu" audioBytes=108000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu", appendText="<null>", markCompleted=false at 2025-10-05T13:40:26.966
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escucho perfectamente. ..." -> new content="Sí, te escucho perfectamente. ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFW5pxn31WpIYBFLqyzC chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ¿Cómo te gustaría em...", isUser=false, status=streaming at 2025-10-05T13:40:26.967
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ...", isUser=false, status=streaming at 2025-10-05T13:40:26.967
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 3 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escucho perfectamente. ..." -> "Sí, te escucho perfectamente. ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 3
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 3 messages at 2025-10-05T13:40:26.967
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:26.968
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 3 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:26.981
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 3 messages at 2025-10-05T13:40:26.982
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=62 transcript="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu" audioBytes=120000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu", appendText="<null>", markCompleted=false at 2025-10-05T13:40:27.006
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escucho perfectamente. ..." -> new content="Sí, te escucho perfectamente. ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFW5pxn31WpIYBFLqyzC chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ¿Cómo te gustaría em...", isUser=false, status=streaming at 2025-10-05T13:40:27.007
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ...", isUser=false, status=streaming at 2025-10-05T13:40:27.007
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 3 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escucho perfectamente. ..." -> "Sí, te escucho perfectamente. ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 3
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 3 messages at 2025-10-05T13:40:27.008
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:27.008
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 3 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:27.010
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 3 messages at 2025-10-05T13:40:27.010
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=62 transcript="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu" audioBytes=132000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu", appendText="<null>", markCompleted=false at 2025-10-05T13:40:27.046
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escucho perfectamente. ..." -> new content="Sí, te escucho perfectamente. ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFW5pxn31WpIYBFLqyzC chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ¿Cómo te gustaría em...", isUser=false, status=streaming at 2025-10-05T13:40:27.048
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ...", isUser=false, status=streaming at 2025-10-05T13:40:27.048
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 3 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escucho perfectamente. ..." -> "Sí, te escucho perfectamente. ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 3
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 3 messages at 2025-10-05T13:40:27.048
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:27.049
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 3 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:27.051
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 3 messages at 2025-10-05T13:40:27.052
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=62 transcript="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu" audioBytes=144000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu", appendText="<null>", markCompleted=false at 2025-10-05T13:40:27.082
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escucho perfectamente. ..." -> new content="Sí, te escucho perfectamente. ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFW5pxn31WpIYBFLqyzC chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ¿Cómo te gustaría em...", isUser=false, status=streaming at 2025-10-05T13:40:27.083
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ...", isUser=false, status=streaming at 2025-10-05T13:40:27.083
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 3 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escucho perfectamente. ..." -> "Sí, te escucho perfectamente. ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 3
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 3 messages at 2025-10-05T13:40:27.084
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:27.084
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 3 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:27.086
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 3 messages at 2025-10-05T13:40:27.086
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=62 transcript="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu" audioBytes=156000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu", appendText="<null>", markCompleted=false at 2025-10-05T13:40:27.119
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escucho perfectamente. ..." -> new content="Sí, te escucho perfectamente. ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFW5pxn31WpIYBFLqyzC chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ¿Cómo te gustaría em...", isUser=false, status=streaming at 2025-10-05T13:40:27.120
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ...", isUser=false, status=streaming at 2025-10-05T13:40:27.120
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 3 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escucho perfectamente. ..." -> "Sí, te escucho perfectamente. ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 3
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 3 messages at 2025-10-05T13:40:27.120
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:27.121
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 3 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=66 transcript="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu med" audioBytes=156000 deltaTextLen=0 deltaTranscriptLen=4 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu med", appendText=" med", markCompleted=false at 2025-10-05T13:40:27.122
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escucho perfectamente. ..." -> new content="Sí, te escucho perfectamente. ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ¿Cómo te gustaría em...", isUser=false, status=streaming at 2025-10-05T13:40:27.122
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ...", isUser=false, status=streaming at 2025-10-05T13:40:27.122
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 3 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escucho perfectamente. ..." -> "Sí, te escucho perfectamente. ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 3
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 3 messages at 2025-10-05T13:40:27.123
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:27.123
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 3 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=73 transcript="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu meditación" audioBytes=156000 deltaTextLen=0 deltaTranscriptLen=7 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu meditación", appendText="itación", markCompleted=false at 2025-10-05T13:40:27.129
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escucho perfectamente. ..." -> new content="Sí, te escucho perfectamente. ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ¿Cómo te gustaría em...", isUser=false, status=streaming at 2025-10-05T13:40:27.130
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ...", isUser=false, status=streaming at 2025-10-05T13:40:27.130
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 3 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escucho perfectamente. ..." -> "Sí, te escucho perfectamente. ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 3
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 3 messages at 2025-10-05T13:40:27.130
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:27.130
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 3 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:27.134
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 3 messages at 2025-10-05T13:40:27.134
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=77 transcript="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu meditación hoy" audioBytes=156000 deltaTextLen=0 deltaTranscriptLen=4 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu meditación hoy", appendText=" hoy", markCompleted=false at 2025-10-05T13:40:27.141
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escucho perfectamente. ..." -> new content="Sí, te escucho perfectamente. ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ¿Cómo te gustaría em...", isUser=false, status=streaming at 2025-10-05T13:40:27.142
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ...", isUser=false, status=streaming at 2025-10-05T13:40:27.142
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 3 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escucho perfectamente. ..." -> "Sí, te escucho perfectamente. ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 3
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 3 messages at 2025-10-05T13:40:27.142
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:27.143
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 3 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=78 transcript="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu meditación hoy?" audioBytes=156000 deltaTextLen=0 deltaTranscriptLen=1 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu meditación hoy?", appendText="?", markCompleted=false at 2025-10-05T13:40:27.144
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escucho perfectamente. ..." -> new content="Sí, te escucho perfectamente. ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ¿Cómo te gustaría em...", isUser=false, status=streaming at 2025-10-05T13:40:27.144
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ...", isUser=false, status=streaming at 2025-10-05T13:40:27.145
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 3 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escucho perfectamente. ..." -> "Sí, te escucho perfectamente. ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 3
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 3 messages at 2025-10-05T13:40:27.145
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:27.146
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 3 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:27.148
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 3 messages at 2025-10-05T13:40:27.149
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=78 transcript="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu meditación hoy?" audioBytes=168000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu meditación hoy?", appendText="<null>", markCompleted=false at 2025-10-05T13:40:27.203
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escucho perfectamente. ..." -> new content="Sí, te escucho perfectamente. ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFW5pxn31WpIYBFLqyzC chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ¿Cómo te gustaría em...", isUser=false, status=streaming at 2025-10-05T13:40:27.204
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ...", isUser=false, status=streaming at 2025-10-05T13:40:27.204
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 3 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escucho perfectamente. ..." -> "Sí, te escucho perfectamente. ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 3
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 3 messages at 2025-10-05T13:40:27.205
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:27.205
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 3 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:27.207
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 3 messages at 2025-10-05T13:40:27.208
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=78 transcript="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu meditación hoy?" audioBytes=180000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu meditación hoy?", appendText="<null>", markCompleted=false at 2025-10-05T13:40:27.239
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escucho perfectamente. ..." -> new content="Sí, te escucho perfectamente. ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFW5pxn31WpIYBFLqyzC chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ¿Cómo te gustaría em...", isUser=false, status=streaming at 2025-10-05T13:40:27.240
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ...", isUser=false, status=streaming at 2025-10-05T13:40:27.241
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 3 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escucho perfectamente. ..." -> "Sí, te escucho perfectamente. ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 3
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 3 messages at 2025-10-05T13:40:27.242
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:27.242
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 3 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:27.250
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 3 messages at 2025-10-05T13:40:27.251
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=78 transcript="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu meditación hoy?" audioBytes=192000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu meditación hoy?", appendText="<null>", markCompleted=false at 2025-10-05T13:40:27.278
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escucho perfectamente. ..." -> new content="Sí, te escucho perfectamente. ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFW5pxn31WpIYBFLqyzC chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ¿Cómo te gustaría em...", isUser=false, status=streaming at 2025-10-05T13:40:27.279
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ...", isUser=false, status=streaming at 2025-10-05T13:40:27.279
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 3 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escucho perfectamente. ..." -> "Sí, te escucho perfectamente. ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 3
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 3 messages at 2025-10-05T13:40:27.280
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:27.280
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 3 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:27.283
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 3 messages at 2025-10-05T13:40:27.284
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=78 transcript="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu meditación hoy?" audioBytes=204000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu meditación hoy?", appendText="<null>", markCompleted=false at 2025-10-05T13:40:27.315
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escucho perfectamente. ..." -> new content="Sí, te escucho perfectamente. ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFW5pxn31WpIYBFLqyzC chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ¿Cómo te gustaría em...", isUser=false, status=streaming at 2025-10-05T13:40:27.316
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ...", isUser=false, status=streaming at 2025-10-05T13:40:27.316
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 3 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escucho perfectamente. ..." -> "Sí, te escucho perfectamente. ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 3
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 3 messages at 2025-10-05T13:40:27.317
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:27.317
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 3 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:27.322
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 3 messages at 2025-10-05T13:40:27.323
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=78 transcript="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu meditación hoy?" audioBytes=216000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu meditación hoy?", appendText="<null>", markCompleted=false at 2025-10-05T13:40:27.356
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escucho perfectamente. ..." -> new content="Sí, te escucho perfectamente. ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFW5pxn31WpIYBFLqyzC chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ¿Cómo te gustaría em...", isUser=false, status=streaming at 2025-10-05T13:40:27.357
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ...", isUser=false, status=streaming at 2025-10-05T13:40:27.357
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 3 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escucho perfectamente. ..." -> "Sí, te escucho perfectamente. ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 3
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 3 messages at 2025-10-05T13:40:27.358
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:27.359
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 3 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:27.366
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 3 messages at 2025-10-05T13:40:27.367
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=78 transcript="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu meditación hoy?" audioBytes=228000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu meditación hoy?", appendText="<null>", markCompleted=false at 2025-10-05T13:40:27.391
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escucho perfectamente. ..." -> new content="Sí, te escucho perfectamente. ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFW5pxn31WpIYBFLqyzC chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ¿Cómo te gustaría em...", isUser=false, status=streaming at 2025-10-05T13:40:27.392
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ...", isUser=false, status=streaming at 2025-10-05T13:40:27.392
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 3 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escucho perfectamente. ..." -> "Sí, te escucho perfectamente. ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 3
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 3 messages at 2025-10-05T13:40:27.392
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:27.393
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 3 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:27.401
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 3 messages at 2025-10-05T13:40:27.403
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=78 transcript="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu meditación hoy?" audioBytes=252000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=24000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu meditación hoy?", appendText="<null>", markCompleted=false at 2025-10-05T13:40:27.433
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escucho perfectamente. ..." -> new content="Sí, te escucho perfectamente. ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFW5pxn31WpIYBFLqyzC chunkBytes=24000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ¿Cómo te gustaría em...", isUser=false, status=streaming at 2025-10-05T13:40:27.435
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ...", isUser=false, status=streaming at 2025-10-05T13:40:27.435
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 3 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escucho perfectamente. ..." -> "Sí, te escucho perfectamente. ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 3
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 3 messages at 2025-10-05T13:40:27.436
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:27.437
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 3 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:27.453
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 3 messages at 2025-10-05T13:40:27.453
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=78 transcript="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu meditación hoy?" audioBytes=252000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu meditación hoy?", appendText="<null>", markCompleted=false at 2025-10-05T13:40:27.464
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escucho perfectamente. ..." -> new content="Sí, te escucho perfectamente. ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ¿Cómo te gustaría em...", isUser=false, status=streaming at 2025-10-05T13:40:27.465
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation item completed role=assistant text="<empty>" transcriptLen=78 transcript="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu meditación hoy?" audioBytes=252000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="Sí, te escucho perfectamente. ¿Cómo te gustaría empezar con tu meditación hoy?", appendText="<null>", markCompleted=true at 2025-10-05T13:40:27.465
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escucho perfectamente. ..." -> new content="Sí, te escucho perfectamente. ...", status=completed
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ...", isUser=false, status=streaming at 2025-10-05T13:40:27.466
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 3 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escucho perfectamente. ..." -> "Sí, te escucho perfectamente. ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 3
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 3 messages at 2025-10-05T13:40:27.467
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ¿Cómo te gustaría em...", isUser=false, status=completed at 2025-10-05T13:40:27.467
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:27.467
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 3 messages
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ...", isUser=false, status=completed at 2025-10-05T13:40:27.468
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 3 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escucho perfectamente. ..." -> "Sí, te escucho perfectamente. ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 3
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 3 messages at 2025-10-05T13:40:27.470
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:27.470
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 3 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:27.475
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 3 messages at 2025-10-05T13:40:27.477
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Voice Assistant/Voice Assistant Repository User Message] VoiceAssistantRepository - TEXT MESSAGE SEND START: id=1759657233802, content="Nice", isUser=true at 2025-10-05T13:40:33.802
[Voice Assistant/Voice Assistant Repository User Message] VoiceAssistantRepository - TEXT MESSAGE TYPE: This is a text message from UI, should create awaiting message
[Voice Assistant/Voice Assistant Repository User Message] VoiceAssistantRepository - TEXT MESSAGE: Adding to _messages list at 2025-10-05T13:40:33.803
[Voice Assistant/Voice Assistant Repository User Message] VoiceAssistantRepository - TEXT MESSAGE: Added to local list, index=2, total=3
[Voice Assistant/Voice Assistant Repository User Message] VoiceAssistantRepository - TEXT MESSAGE: Emitting to stream at 2025-10-05T13:40:33.804
[Voice Assistant/Voice Assistant Repository User Message] VoiceAssistantRepository - TEXT MESSAGE: Emitted to stream, controller closed=false
[Voice Assistant/Voice Assistant Repository User Message] VoiceAssistantRepository - TEXT MESSAGE: Stored as awaiting message with key="Nice"
[Voice Assistant/Voice Assistant Repository Stream] VoiceAssistantRepository - Total messages in list: 3
[Voice Assistant/Voice Assistant Repository Stream] VoiceAssistantRepository - Stream controller closed: false
[Voice Assistant/Voice Assistant Repository Stream] VoiceAssistantRepository - Sending message, client connected: true
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: MessageSending at 2025-10-05T13:40:33.806
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 3 messages
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=1759657233802, content="Nice", isUser=true, status=pending at 2025-10-05T13:40:33.808
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: MessageSent at 2025-10-05T13:40:33.809
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 4 messages
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=1759657233802, content="Nice", isUser=true, status=pending at 2025-10-05T13:40:33.811
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process USER message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=1759657233802 in 4 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 3
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Nice" -> "Nice"
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 4
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 4 messages at 2025-10-05T13:40:33.812
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:33.813
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 4 messages
[Voice Assistant/Voice Assistant Repository OpenAI] VoiceAssistantRepository - Message sent to OpenAI client at 2025-10-05T13:40:33.815
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:33.815
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 4 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:33.820
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 4 messages at 2025-10-05T13:40:33.821
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=user text="Nice" transcriptLen=0 transcript="<empty>" audioBytes=0 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository User Message] VoiceAssistantRepository - _upsertUserMessage START: messageId=evt_bAbSRbUAtHAmwzWQi, transcript="", deltaTranscript="<null>", markCompleted=false at 2025-10-05T13:40:34.004
[Voice Assistant/Voice Assistant Repository User Message] VoiceAssistantRepository - MESSAGE TYPE CHECK: Is this voice message (should create by ID) or text message (should find awaiting)?
[Voice Assistant/Voice Assistant Repository User Message] VoiceAssistantRepository - No transcript text provided, skipping user message upsert
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation item appended role=user text="Nice" transcriptLen=0 transcript="<empty>" audioBytes=0 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository User Message] VoiceAssistantRepository - _upsertUserMessage START: messageId=evt_bAbSRbUAtHAmwzWQi, transcript="", deltaTranscript="<null>", markCompleted=false at 2025-10-05T13:40:34.004
[Voice Assistant/Voice Assistant Repository User Message] VoiceAssistantRepository - MESSAGE TYPE CHECK: Is this voice message (should create by ID) or text message (should find awaiting)?
[Voice Assistant/Voice Assistant Repository User Message] VoiceAssistantRepository - No transcript text provided, skipping user message upsert
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation item completed role=user text="Nice" transcriptLen=0 transcript="<empty>" audioBytes=0 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository User Message] VoiceAssistantRepository - _upsertUserMessage START: messageId=evt_bAbSRbUAtHAmwzWQi, transcript="", deltaTranscript="<null>", markCompleted=true at 2025-10-05T13:40:34.004
[Voice Assistant/Voice Assistant Repository User Message] VoiceAssistantRepository - MESSAGE TYPE CHECK: Is this voice message (should create by ID) or text message (should find awaiting)?
[Voice Assistant/Voice Assistant Repository User Message] VoiceAssistantRepository - No transcript text provided, skipping user message upsert
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=0 transcript="<empty>" audioBytes=0 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="<null>", appendText="<null>", markCompleted=false at 2025-10-05T13:40:34.180
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation item appended role=assistant text="<empty>" transcriptLen=0 transcript="<empty>" audioBytes=0 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="<null>", appendText="<null>", markCompleted=false at 2025-10-05T13:40:34.180
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=3 transcript="Qué" audioBytes=0 deltaTextLen=0 deltaTranscriptLen=3 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué", appendText="Qué", markCompleted=false at 2025-10-05T13:40:34.196
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Creating new assistant message: content="Qué", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Added new assistant message to list (index=3)
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué", isUser=false, status=streaming at 2025-10-05T13:40:34.197
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué", isUser=false, status=streaming at 2025-10-05T13:40:34.197
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 4 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc Message Processing] ChatBloc - NOT FOUND: Adding new message to list
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:34.198
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:34.198
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:34.200
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:34.201
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=9 transcript="Qué bueno" audioBytes=0 deltaTextLen=0 deltaTranscriptLen=6 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno", appendText=" bueno", markCompleted=false at 2025-10-05T13:40:34.216
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué" -> new content="Qué bueno bueno", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno bueno", isUser=false, status=streaming at 2025-10-05T13:40:34.217
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno bueno", isUser=false, status=streaming at 2025-10-05T13:40:34.217
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué" -> "Qué bueno bueno"
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:34.218
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:34.218
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=13 transcript="Qué bueno que" audioBytes=0 deltaTextLen=0 deltaTranscriptLen=4 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que", appendText=" que", markCompleted=false at 2025-10-05T13:40:34.220
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno bueno" -> new content="Qué bueno que que", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que que", isUser=false, status=streaming at 2025-10-05T13:40:34.220
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que que", isUser=false, status=streaming at 2025-10-05T13:40:34.220
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno bueno"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno bueno" -> "Qué bueno que que"
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:34.222
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:34.222
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:34.224
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:34.224
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que que", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=13 transcript="Qué bueno que" audioBytes=4800 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=4800
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que", appendText="<null>", markCompleted=false at 2025-10-05T13:40:34.310
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que que" -> new content="Qué bueno que", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=4800
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que", isUser=false, status=streaming at 2025-10-05T13:40:34.311
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que", isUser=false, status=streaming at 2025-10-05T13:40:34.311
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que que"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que que" -> "Qué bueno que"
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:34.313
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:34.313
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:34.315
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:34.316
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=13 transcript="Qué bueno que" audioBytes=12000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=7200
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que", appendText="<null>", markCompleted=false at 2025-10-05T13:40:34.373
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que" -> new content="Qué bueno que", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=7200
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que", isUser=false, status=streaming at 2025-10-05T13:40:34.375
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que", isUser=false, status=streaming at 2025-10-05T13:40:34.375
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que" -> "Qué bueno que"
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:34.376
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:34.377
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:34.379
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:34.379
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=13 transcript="Qué bueno que" audioBytes=24000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que", appendText="<null>", markCompleted=false at 2025-10-05T13:40:34.486
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que" -> new content="Qué bueno que", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que", isUser=false, status=streaming at 2025-10-05T13:40:34.487
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que", isUser=false, status=streaming at 2025-10-05T13:40:34.488
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que" -> "Qué bueno que"
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:34.489
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:34.490
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=18 transcript="Qué bueno que todo" audioBytes=24000 deltaTextLen=0 deltaTranscriptLen=5 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo", appendText=" todo", markCompleted=false at 2025-10-05T13:40:34.491
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que" -> new content="Qué bueno que todo todo", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo todo", isUser=false, status=streaming at 2025-10-05T13:40:34.492
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo todo", isUser=false, status=streaming at 2025-10-05T13:40:34.492
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que" -> "Qué bueno que todo todo"
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:34.493
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:34.493
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=21 transcript="Qué bueno que todo se" audioBytes=24000 deltaTextLen=0 deltaTranscriptLen=3 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se", appendText=" se", markCompleted=false at 2025-10-05T13:40:34.495
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo todo" -> new content="Qué bueno que todo se se", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se se", isUser=false, status=streaming at 2025-10-05T13:40:34.495
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se se", isUser=false, status=streaming at 2025-10-05T13:40:34.495
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo t..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo todo" -> "Qué bueno que todo se se"
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:34.496
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:34.496
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=25 transcript="Qué bueno que todo se esc" audioBytes=24000 deltaTextLen=0 deltaTranscriptLen=4 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se esc", appendText=" esc", markCompleted=false at 2025-10-05T13:40:34.497
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se se" -> new content="Qué bueno que todo se esc esc", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se esc esc", isUser=false, status=streaming at 2025-10-05T13:40:34.498
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se esc esc", isUser=false, status=streaming at 2025-10-05T13:40:34.498
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se se" -> "Qué bueno que todo se esc esc"
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:34.499
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:34.499
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:34.500
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:34.501
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se esc esc", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=25 transcript="Qué bueno que todo se esc" audioBytes=36000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se esc", appendText="<null>", markCompleted=false at 2025-10-05T13:40:34.532
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se esc esc" -> new content="Qué bueno que todo se esc", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se esc", isUser=false, status=streaming at 2025-10-05T13:40:34.533
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se esc", isUser=false, status=streaming at 2025-10-05T13:40:34.533
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se esc esc" -> "Qué bueno que todo se esc"
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:34.535
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:34.535
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=25 transcript="Qué bueno que todo se esc" audioBytes=48000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se esc", appendText="<null>", markCompleted=false at 2025-10-05T13:40:34.537
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se esc" -> new content="Qué bueno que todo se esc", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se esc", isUser=false, status=streaming at 2025-10-05T13:40:34.538
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se esc", isUser=false, status=streaming at 2025-10-05T13:40:34.538
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se esc" -> "Qué bueno que todo se esc"
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:34.539
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:34.540
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:34.543
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:34.544
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se esc", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=29 transcript="Qué bueno que todo se escuche" audioBytes=48000 deltaTextLen=0 deltaTranscriptLen=4 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche", appendText="uche", markCompleted=false at 2025-10-05T13:40:34.568
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se esc" -> new content="Qué bueno que todo se escucheu...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escucheuche", isUser=false, status=streaming at 2025-10-05T13:40:34.568
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escucheu...", isUser=false, status=streaming at 2025-10-05T13:40:34.569
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se esc" -> "Qué bueno que todo se escucheu..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:34.569
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:34.569
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:34.571
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:34.574
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escucheu...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=34 transcript="Qué bueno que todo se escuche bien" audioBytes=48000 deltaTextLen=0 deltaTranscriptLen=5 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien", appendText=" bien", markCompleted=false at 2025-10-05T13:40:34.586
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escucheu..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien bien", isUser=false, status=streaming at 2025-10-05T13:40:34.586
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:34.586
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escucheu..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:34.587
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:34.587
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:34.589
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:34.590
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=35 transcript="Qué bueno que todo se escuche bien." audioBytes=48000 deltaTextLen=0 deltaTranscriptLen=1 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien.", appendText=".", markCompleted=false at 2025-10-05T13:40:34.599
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien..", isUser=false, status=streaming at 2025-10-05T13:40:34.600
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:34.600
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:34.601
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:34.601
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:34.604
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:34.606
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=35 transcript="Qué bueno que todo se escuche bien." audioBytes=60000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien.", appendText="<null>", markCompleted=false at 2025-10-05T13:40:34.640
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien.", isUser=false, status=streaming at 2025-10-05T13:40:34.641
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:34.642
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:34.642
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:34.643
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:34.644
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:34.645
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=35 transcript="Qué bueno que todo se escuche bien." audioBytes=72000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien.", appendText="<null>", markCompleted=false at 2025-10-05T13:40:34.687
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien.", isUser=false, status=streaming at 2025-10-05T13:40:34.688
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:34.689
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:34.689
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:34.690
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:34.691
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:34.692
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=35 transcript="Qué bueno que todo se escuche bien." audioBytes=84000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien.", appendText="<null>", markCompleted=false at 2025-10-05T13:40:34.729
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien.", isUser=false, status=streaming at 2025-10-05T13:40:34.730
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:34.730
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:34.731
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:34.732
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=37 transcript="Qué bueno que todo se escuche bien. ¿" audioBytes=84000 deltaTextLen=0 deltaTranscriptLen=2 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿", appendText=" ¿", markCompleted=false at 2025-10-05T13:40:34.733
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿ ¿", isUser=false, status=streaming at 2025-10-05T13:40:34.733
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:34.733
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:34.734
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:34.734
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:34.739
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:34.739
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=40 transcript="Qué bueno que todo se escuche bien. ¿Hay" audioBytes=84000 deltaTextLen=0 deltaTranscriptLen=3 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay", appendText="Hay", markCompleted=false at 2025-10-05T13:40:34.750
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿HayHay", isUser=false, status=streaming at 2025-10-05T13:40:34.751
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:34.751
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:34.751
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:34.752
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=46 transcript="Qué bueno que todo se escuche bien. ¿Hay algún" audioBytes=84000 deltaTextLen=0 deltaTranscriptLen=6 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún", appendText=" algún", markCompleted=false at 2025-10-05T13:40:34.753
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún alg...", isUser=false, status=streaming at 2025-10-05T13:40:34.753
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:34.754
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:34.755
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:34.755
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:34.758
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:34.758
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=51 transcript="Qué bueno que todo se escuche bien. ¿Hay algún tipo" audioBytes=84000 deltaTextLen=0 deltaTranscriptLen=5 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo", appendText=" tipo", markCompleted=false at 2025-10-05T13:40:34.769
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:34.769
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:34.770
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:34.770
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:34.770
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:34.773
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:34.774
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=54 transcript="Qué bueno que todo se escuche bien. ¿Hay algún tipo de" audioBytes=84000 deltaTextLen=0 deltaTranscriptLen=3 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de", appendText=" de", markCompleted=false at 2025-10-05T13:40:34.783
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:34.784
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:34.784
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:34.784
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:34.785
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=58 transcript="Qué bueno que todo se escuche bien. ¿Hay algún tipo de med" audioBytes=84000 deltaTextLen=0 deltaTranscriptLen=4 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de med", appendText=" med", markCompleted=false at 2025-10-05T13:40:34.786
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:34.787
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:34.787
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:34.788
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:34.788
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:34.791
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:34.791
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=65 transcript="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación" audioBytes=84000 deltaTextLen=0 deltaTranscriptLen=7 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación", appendText="itación", markCompleted=false at 2025-10-05T13:40:34.800
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:34.801
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:34.801
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:34.802
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:34.802
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:34.805
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:34.805
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=65 transcript="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación" audioBytes=96000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación", appendText="<null>", markCompleted=false at 2025-10-05T13:40:34.872
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:34.873
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:34.873
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:34.874
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:34.874
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:34.877
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:34.878
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=65 transcript="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación" audioBytes=108000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación", appendText="<null>", markCompleted=false at 2025-10-05T13:40:34.906
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:34.907
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:34.907
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:34.908
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:34.908
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:34.910
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:34.911
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=65 transcript="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación" audioBytes=120000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación", appendText="<null>", markCompleted=false at 2025-10-05T13:40:34.950
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:34.951
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:34.951
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:34.952
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:34.953
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:34.956
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:34.956
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=65 transcript="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación" audioBytes=132000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación", appendText="<null>", markCompleted=false at 2025-10-05T13:40:34.990
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:34.991
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:34.992
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:34.993
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:34.994
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:35.005
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:35.006
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=65 transcript="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación" audioBytes=144000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación", appendText="<null>", markCompleted=false at 2025-10-05T13:40:35.034
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.035
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.035
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.037
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.037
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:35.039
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:35.039
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=65 transcript="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación" audioBytes=156000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación", appendText="<null>", markCompleted=false at 2025-10-05T13:40:35.077
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.078
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.078
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.079
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.080
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=67 transcript="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o" audioBytes=156000 deltaTextLen=0 deltaTranscriptLen=2 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o", appendText=" o", markCompleted=false at 2025-10-05T13:40:35.081
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.081
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.082
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.083
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.083
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:35.088
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:35.089
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=75 transcript="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque" audioBytes=156000 deltaTextLen=0 deltaTranscriptLen=8 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque", appendText=" enfoque", markCompleted=false at 2025-10-05T13:40:35.098
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.098
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.098
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.099
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.099
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=78 transcript="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en" audioBytes=156000 deltaTextLen=0 deltaTranscriptLen=3 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en", appendText=" en", markCompleted=false at 2025-10-05T13:40:35.101
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.101
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.101
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.102
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.102
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:35.105
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:35.106
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=89 transcript="... que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular" audioBytes=156000 deltaTextLen=0 deltaTranscriptLen=11 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular", appendText=" particular", markCompleted=false at 2025-10-05T13:40:35.114
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.115
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.115
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.116
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.116
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=93 transcript="... todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que" audioBytes=156000 deltaTextLen=0 deltaTranscriptLen=4 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que", appendText=" que", markCompleted=false at 2025-10-05T13:40:35.118
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.118
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.118
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.119
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.119
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:35.122
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:35.122
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=96 transcript="...do se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te" audioBytes=156000 deltaTextLen=0 deltaTranscriptLen=3 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te", appendText=" te", markCompleted=false at 2025-10-05T13:40:35.133
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.134
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.134
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.136
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.136
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=105 transcript="...uche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría" audioBytes=156000 deltaTextLen=0 deltaTranscriptLen=9 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría", appendText=" gustaría", markCompleted=false at 2025-10-05T13:40:35.137
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.138
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.138
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.139
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.139
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:35.141
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:35.142
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=105 transcript="...uche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría" audioBytes=168000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría", appendText="<null>", markCompleted=false at 2025-10-05T13:40:35.203
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.205
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.206
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.213
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.216
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:35.228
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:35.232
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=105 transcript="...uche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría" audioBytes=180000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría", appendText="<null>", markCompleted=false at 2025-10-05T13:40:35.269
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.272
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.273
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.274
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.276
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:35.290
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:35.291
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=105 transcript="...uche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría" audioBytes=192000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría", appendText="<null>", markCompleted=false at 2025-10-05T13:40:35.311
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.317
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.317
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.319
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.322
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:35.326
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:35.327
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=105 transcript="...uche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría" audioBytes=204000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría", appendText="<null>", markCompleted=false at 2025-10-05T13:40:35.342
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.347
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.347
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.351
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.352
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:35.357
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:35.358
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=105 transcript="...uche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría" audioBytes=216000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría", appendText="<null>", markCompleted=false at 2025-10-05T13:40:35.370
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.372
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.372
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.373
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.373
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:35.376
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:35.377
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=105 transcript="...uche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría" audioBytes=228000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría", appendText="<null>", markCompleted=false at 2025-10-05T13:40:35.411
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.413
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.413
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.414
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.415
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:35.416
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:35.417
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=105 transcript="...uche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría" audioBytes=240000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría", appendText="<null>", markCompleted=false at 2025-10-05T13:40:35.449
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.451
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.451
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.452
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.453
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:35.455
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:35.456
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=105 transcript="...uche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría" audioBytes=252000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría", appendText="<null>", markCompleted=false at 2025-10-05T13:40:35.489
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.490
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.491
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.491
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.492
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:35.505
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:35.506
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=105 transcript="...uche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría" audioBytes=264000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría", appendText="<null>", markCompleted=false at 2025-10-05T13:40:35.528
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.529
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.529
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.530
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.531
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=115 transcript="... ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar" audioBytes=264000 deltaTextLen=0 deltaTranscriptLen=10 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar", appendText=" practicar", markCompleted=false at 2025-10-05T13:40:35.532
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.532
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.532
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.533
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.534
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=119 transcript="...y algún tipo de meditación o enfoque en particular que te gustaría practicar hoy" audioBytes=264000 deltaTextLen=0 deltaTranscriptLen=4 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy", appendText=" hoy", markCompleted=false at 2025-10-05T13:40:35.537
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.538
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.538
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.538
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.539
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:35.540
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:35.541
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=120 transcript="... algún tipo de meditación o enfoque en particular que te gustaría practicar hoy?" audioBytes=264000 deltaTextLen=0 deltaTranscriptLen=1 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy?", appendText="?", markCompleted=false at 2025-10-05T13:40:35.551
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.552
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.552
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.554
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.554
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:35.557
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:35.558
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=126 transcript="... tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede" audioBytes=264000 deltaTextLen=0 deltaTranscriptLen=6 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede", appendText=" Puede", markCompleted=false at 2025-10-05T13:40:35.569
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.570
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.570
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.571
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.571
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:35.572
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:35.573
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=130 transcript="...o de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser" audioBytes=264000 deltaTextLen=0 deltaTranscriptLen=4 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser", appendText=" ser", markCompleted=false at 2025-10-05T13:40:35.582
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.582
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.583
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.583
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.583
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=135 transcript="...meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo" audioBytes=264000 deltaTextLen=0 deltaTranscriptLen=5 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo", appendText=" algo", markCompleted=false at 2025-10-05T13:40:35.585
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.585
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.585
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.586
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.586
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:35.588
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:35.589
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=135 transcript="...meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo" audioBytes=276000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo", appendText="<null>", markCompleted=false at 2025-10-05T13:40:35.626
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.627
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.627
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.628
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.628
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:35.630
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:35.631
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=135 transcript="...meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo" audioBytes=288000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo", appendText="<null>", markCompleted=false at 2025-10-05T13:40:35.670
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.671
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.671
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.672
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.673
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:35.674
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:35.675
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=135 transcript="...meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo" audioBytes=300000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo", appendText="<null>", markCompleted=false at 2025-10-05T13:40:35.707
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.708
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.708
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.709
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.709
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:35.722
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:35.723
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=135 transcript="...meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo" audioBytes=312000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo", appendText="<null>", markCompleted=false at 2025-10-05T13:40:35.746
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.747
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.747
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.748
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.749
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:35.750
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:35.751
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=135 transcript="...meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo" audioBytes=324000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo", appendText="<null>", markCompleted=false at 2025-10-05T13:40:35.783
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.784
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.784
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.785
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.785
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:35.786
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:35.787
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=135 transcript="...meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo" audioBytes=336000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo", appendText="<null>", markCompleted=false at 2025-10-05T13:40:35.823
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.824
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.824
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.825
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.825
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:35.826
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:35.827
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=135 transcript="...meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo" audioBytes=348000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo", appendText="<null>", markCompleted=false at 2025-10-05T13:40:35.875
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.876
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.876
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.877
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.878
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:35.879
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:35.880
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=135 transcript="...meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo" audioBytes=360000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo", appendText="<null>", markCompleted=false at 2025-10-05T13:40:35.911
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.913
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.913
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.916
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.917
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:35.919
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:35.920
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=135 transcript="...meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo" audioBytes=372000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo", appendText="<null>", markCompleted=false at 2025-10-05T13:40:35.953
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.954
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.954
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.955
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.956
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:35.957
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:35.958
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=140 transcript="...ación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para" audioBytes=372000 deltaTextLen=0 deltaTranscriptLen=5 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para", appendText=" para", markCompleted=false at 2025-10-05T13:40:35.965
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.965
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.965
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.966
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.966
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=146 transcript="...o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relaj" audioBytes=372000 deltaTextLen=0 deltaTranscriptLen=6 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relaj", appendText=" relaj", markCompleted=false at 2025-10-05T13:40:35.967
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.968
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.968
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.969
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.969
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=150 transcript="...foque en particular que te gustaría practicar hoy? Puede ser algo para relajarte" audioBytes=372000 deltaTextLen=0 deltaTranscriptLen=4 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte", appendText="arte", markCompleted=false at 2025-10-05T13:40:35.970
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.971
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.971
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.972
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.972
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:35.973
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:35.973
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=151 transcript="...oque en particular que te gustaría practicar hoy? Puede ser algo para relajarte," audioBytes=372000 deltaTextLen=0 deltaTranscriptLen=1 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte,", appendText=",", markCompleted=false at 2025-10-05T13:40:35.982
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.982
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.983
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.983
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.983
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=157 transcript="...n particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfoc" audioBytes=372000 deltaTextLen=0 deltaTranscriptLen=6 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfoc", appendText=" enfoc", markCompleted=false at 2025-10-05T13:40:35.985
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.985
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.985
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.986
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.986
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:35.988
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:35.989
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=161 transcript="...rticular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte" audioBytes=372000 deltaTextLen=0 deltaTranscriptLen=4 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte", appendText="arte", markCompleted=false at 2025-10-05T13:40:35.998
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:35.998
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:35.998
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:35.999
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:35.999
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=164 transcript="...cular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en" audioBytes=372000 deltaTextLen=0 deltaTranscriptLen=3 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en", appendText=" en", markCompleted=false at 2025-10-05T13:40:36.001
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:36.001
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:36.001
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:36.002
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:36.002
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:36.005
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:36.006
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=167 transcript="...ar que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la" audioBytes=372000 deltaTextLen=0 deltaTranscriptLen=3 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la", appendText=" la", markCompleted=false at 2025-10-05T13:40:36.016
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:36.017
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:36.017
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:36.017
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:36.018
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:36.022
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:36.023
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=167 transcript="...ar que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la" audioBytes=384000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la", appendText="<null>", markCompleted=false at 2025-10-05T13:40:36.073
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:36.074
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:36.074
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:36.075
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:36.075
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:36.077
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:36.078
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=167 transcript="...ar que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la" audioBytes=396000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la", appendText="<null>", markCompleted=false at 2025-10-05T13:40:36.116
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:36.117
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:36.117
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:36.118
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:36.118
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:36.124
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:36.124
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=167 transcript="...ar que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la" audioBytes=408000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la", appendText="<null>", markCompleted=false at 2025-10-05T13:40:36.154
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:36.155
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:36.155
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:36.156
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:36.157
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:36.172
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:36.173
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=167 transcript="...ar que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la" audioBytes=420000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la", appendText="<null>", markCompleted=false at 2025-10-05T13:40:36.195
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:36.196
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:36.197
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:36.197
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:36.198
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:36.199
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:36.200
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=167 transcript="...ar que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la" audioBytes=432000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la", appendText="<null>", markCompleted=false at 2025-10-05T13:40:36.235
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:36.236
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:36.236
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:36.237
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:36.238
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:36.239
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:36.240
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=167 transcript="...ar que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la" audioBytes=444000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la", appendText="<null>", markCompleted=false at 2025-10-05T13:40:36.273
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:36.274
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:36.274
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:36.275
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:36.276
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:36.289
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:36.290
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=167 transcript="...ar que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la" audioBytes=456000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la", appendText="<null>", markCompleted=false at 2025-10-05T13:40:36.311
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:36.312
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:36.312
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:36.313
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:36.313
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:36.315
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:36.316
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=167 transcript="...ar que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la" audioBytes=468000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la", appendText="<null>", markCompleted=false at 2025-10-05T13:40:36.350
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:36.351
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:36.351
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:36.352
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:36.353
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:36.356
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:36.356
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=167 transcript="...ar que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la" audioBytes=480000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la", appendText="<null>", markCompleted=false at 2025-10-05T13:40:36.403
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:36.404
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:36.404
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:36.405
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:36.406
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:36.407
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:36.408
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=174 transcript="...te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respir" audioBytes=480000 deltaTextLen=0 deltaTranscriptLen=7 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respir", appendText=" respir", markCompleted=false at 2025-10-05T13:40:36.416
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:36.417
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:36.417
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:36.417
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:36.418
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=179 transcript="...staría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración" audioBytes=480000 deltaTextLen=0 deltaTranscriptLen=5 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración", appendText="ación", markCompleted=false at 2025-10-05T13:40:36.419
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:36.419
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:36.420
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:36.421
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:36.422
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=181 transcript="...aría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o" audioBytes=480000 deltaTextLen=0 deltaTranscriptLen=2 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o", appendText=" o", markCompleted=false at 2025-10-05T13:40:36.423
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:36.423
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:36.423
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:36.424
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:36.424
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:36.425
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:36.426
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=193 transcript="...ar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente" audioBytes=480000 deltaTextLen=0 deltaTranscriptLen=12 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente", appendText=" simplemente", markCompleted=false at 2025-10-05T13:40:36.436
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:36.436
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:36.436
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:36.437
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:36.437
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:36.439
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:36.440
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=198 transcript="...y? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para" audioBytes=480000 deltaTextLen=0 deltaTranscriptLen=5 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para", appendText=" para", markCompleted=false at 2025-10-05T13:40:36.450
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:36.450
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:36.450
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:36.451
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:36.451
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:36.456
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:36.456
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=198 transcript="...y? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para" audioBytes=492000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para", appendText="<null>", markCompleted=false at 2025-10-05T13:40:36.488
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:36.489
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:36.489
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:36.490
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:36.491
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:36.506
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:36.506
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=198 transcript="...y? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para" audioBytes=504000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para", appendText="<null>", markCompleted=false at 2025-10-05T13:40:36.527
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:36.528
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:36.528
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:36.529
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:36.530
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:36.539
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:36.540
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=198 transcript="...y? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para" audioBytes=516000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para", appendText="<null>", markCompleted=false at 2025-10-05T13:40:36.564
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:36.565
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:36.565
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:36.566
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:36.567
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:36.569
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:36.569
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=198 transcript="...y? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para" audioBytes=528000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para", appendText="<null>", markCompleted=false at 2025-10-05T13:40:36.604
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:36.608
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:36.608
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:36.609
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:36.610
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:36.623
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:36.623
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=198 transcript="...y? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para" audioBytes=540000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para", appendText="<null>", markCompleted=false at 2025-10-05T13:40:36.645
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:36.645
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:36.646
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:36.646
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:36.647
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:36.649
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:36.649
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=198 transcript="...y? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para" audioBytes=552000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para", appendText="<null>", markCompleted=false at 2025-10-05T13:40:36.689
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:36.690
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:36.690
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:36.691
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:36.691
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:36.706
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:36.707
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=198 transcript="...y? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para" audioBytes=564000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para", appendText="<null>", markCompleted=false at 2025-10-05T13:40:36.731
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:36.732
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:36.732
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:36.733
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:36.734
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:36.739
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:36.740
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=198 transcript="...y? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para" audioBytes=576000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para", appendText="<null>", markCompleted=false at 2025-10-05T13:40:36.766
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:36.767
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:36.767
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:36.768
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:36.769
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:36.770
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:36.771
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=198 transcript="...y? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para" audioBytes=588000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para", appendText="<null>", markCompleted=false at 2025-10-05T13:40:36.806
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:36.807
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:36.808
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:36.809
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:36.809
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=208 transcript="...er algo para relajarte, enfocarte en la respiración o simplemente para encontrar" audioBytes=588000 deltaTextLen=0 deltaTranscriptLen=10 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para encontrar", appendText=" encontrar", markCompleted=false at 2025-10-05T13:40:36.810
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:36.811
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:36.811
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:36.812
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:36.812
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=211 transcript="...algo para relajarte, enfocarte en la respiración o simplemente para encontrar un" audioBytes=588000 deltaTextLen=0 deltaTranscriptLen=3 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para encontrar un", appendText=" un", markCompleted=false at 2025-10-05T13:40:36.815
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:36.815
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:36.815
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:36.816
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:36.816
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:36.823
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:36.823
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=216 transcript="...para relajarte, enfocarte en la respiración o simplemente para encontrar un poco" audioBytes=588000 deltaTextLen=0 deltaTranscriptLen=5 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para encontrar un poco", appendText=" poco", markCompleted=false at 2025-10-05T13:40:36.833
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:36.834
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:36.834
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:36.834
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:36.835
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=219 transcript="...a relajarte, enfocarte en la respiración o simplemente para encontrar un poco de" audioBytes=588000 deltaTextLen=0 deltaTranscriptLen=3 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para encontrar un poco de", appendText=" de", markCompleted=false at 2025-10-05T13:40:36.836
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:36.836
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:36.836
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:36.837
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:36.838
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=225 transcript="...jarte, enfocarte en la respiración o simplemente para encontrar un poco de calma" audioBytes=588000 deltaTextLen=0 deltaTranscriptLen=6 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para encontrar un poco de calma", appendText=" calma", markCompleted=false at 2025-10-05T13:40:36.839
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:36.839
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:36.839
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:36.840
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:36.840
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:36.841
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:36.841
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=226 transcript="...arte, enfocarte en la respiración o simplemente para encontrar un poco de calma." audioBytes=588000 deltaTextLen=0 deltaTranscriptLen=1 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para encontrar un poco de calma.", appendText=".", markCompleted=false at 2025-10-05T13:40:36.850
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:36.850
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:36.851
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:36.851
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:36.851
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=229 transcript="...e, enfocarte en la respiración o simplemente para encontrar un poco de calma. Tú" audioBytes=588000 deltaTextLen=0 deltaTranscriptLen=3 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para encontrar un poco de calma. Tú", appendText=" Tú", markCompleted=false at 2025-10-05T13:40:36.853
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:36.853
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:36.853
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:36.854
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:36.854
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:36.856
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:36.857
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=229 transcript="...e, enfocarte en la respiración o simplemente para encontrar un poco de calma. Tú" audioBytes=600000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para encontrar un poco de calma. Tú", appendText="<null>", markCompleted=false at 2025-10-05T13:40:36.920
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:36.921
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:36.921
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:36.922
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:36.923
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:36.924
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:36.925
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=229 transcript="...e, enfocarte en la respiración o simplemente para encontrar un poco de calma. Tú" audioBytes=612000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para encontrar un poco de calma. Tú", appendText="<null>", markCompleted=false at 2025-10-05T13:40:36.965
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:36.966
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:36.966
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:36.967
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:36.968
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:36.972
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:36.973
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=229 transcript="...e, enfocarte en la respiración o simplemente para encontrar un poco de calma. Tú" audioBytes=624000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para encontrar un poco de calma. Tú", appendText="<null>", markCompleted=false at 2025-10-05T13:40:37.004
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:37.005
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:37.005
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:37.006
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:37.006
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:37.023
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:37.023
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=229 transcript="...e, enfocarte en la respiración o simplemente para encontrar un poco de calma. Tú" audioBytes=636000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para encontrar un poco de calma. Tú", appendText="<null>", markCompleted=false at 2025-10-05T13:40:37.037
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:37.038
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:37.038
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:37.039
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:37.040
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:37.042
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:37.042
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=229 transcript="...e, enfocarte en la respiración o simplemente para encontrar un poco de calma. Tú" audioBytes=648000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para encontrar un poco de calma. Tú", appendText="<null>", markCompleted=false at 2025-10-05T13:40:37.074
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:37.075
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:37.075
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:37.076
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:37.077
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:37.089
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:37.090
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=229 transcript="...e, enfocarte en la respiración o simplemente para encontrar un poco de calma. Tú" audioBytes=660000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para encontrar un poco de calma. Tú", appendText="<null>", markCompleted=false at 2025-10-05T13:40:37.118
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:37.119
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:37.119
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:37.120
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:37.120
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:37.123
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:37.123
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=229 transcript="...e, enfocarte en la respiración o simplemente para encontrar un poco de calma. Tú" audioBytes=672000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para encontrar un poco de calma. Tú", appendText="<null>", markCompleted=false at 2025-10-05T13:40:37.151
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:37.153
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:37.153
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:37.154
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:37.154
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:37.156
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:37.156
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=229 transcript="...e, enfocarte en la respiración o simplemente para encontrar un poco de calma. Tú" audioBytes=684000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para encontrar un poco de calma. Tú", appendText="<null>", markCompleted=false at 2025-10-05T13:40:37.247
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:37.248
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:37.248
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:37.249
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:37.250
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:37.251
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:37.252
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=229 transcript="...e, enfocarte en la respiración o simplemente para encontrar un poco de calma. Tú" audioBytes=696000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para encontrar un poco de calma. Tú", appendText="<null>", markCompleted=false at 2025-10-05T13:40:37.260
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:37.261
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:37.261
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:37.262
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:37.263
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=232 transcript="...enfocarte en la respiración o simplemente para encontrar un poco de calma. Tú me" audioBytes=696000 deltaTextLen=0 deltaTranscriptLen=3 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para encontrar un poco de calma. Tú me", appendText=" me", markCompleted=false at 2025-10-05T13:40:37.264
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:37.264
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:37.264
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:37.265
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:37.265
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=238 transcript="...rte en la respiración o simplemente para encontrar un poco de calma. Tú me dices" audioBytes=696000 deltaTextLen=0 deltaTranscriptLen=6 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para encontrar un poco de calma. Tú me dices", appendText=" dices", markCompleted=false at 2025-10-05T13:40:37.266
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:37.266
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:37.266
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:37.267
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:37.267
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=239 transcript="...te en la respiración o simplemente para encontrar un poco de calma. Tú me dices." audioBytes=696000 deltaTextLen=0 deltaTranscriptLen=1 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para encontrar un poco de calma. Tú me dices.", appendText=".", markCompleted=false at 2025-10-05T13:40:37.269
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:37.269
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:37.269
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:37.270
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:37.270
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:37.274
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:37.275
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=239 transcript="...te en la respiración o simplemente para encontrar un poco de calma. Tú me dices." audioBytes=708000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para encontrar un poco de calma. Tú me dices.", appendText="<null>", markCompleted=false at 2025-10-05T13:40:37.323
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:37.324
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:37.324
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:37.325
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:37.325
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:37.328
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:37.329
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=239 transcript="...te en la respiración o simplemente para encontrar un poco de calma. Tú me dices." audioBytes=720000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para encontrar un poco de calma. Tú me dices.", appendText="<null>", markCompleted=false at 2025-10-05T13:40:37.348
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:37.349
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:37.349
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:37.350
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:37.350
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:37.352
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:37.352
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=239 transcript="...te en la respiración o simplemente para encontrar un poco de calma. Tú me dices." audioBytes=732000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para encontrar un poco de calma. Tú me dices.", appendText="<null>", markCompleted=false at 2025-10-05T13:40:37.387
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:37.388
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:37.389
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:37.390
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:37.390
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:37.406
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:37.406
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=239 transcript="...te en la respiración o simplemente para encontrar un poco de calma. Tú me dices." audioBytes=744000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para encontrar un poco de calma. Tú me dices.", appendText="<null>", markCompleted=false at 2025-10-05T13:40:37.428
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:37.429
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:37.429
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:37.430
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:37.430
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:37.440
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:37.441
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=239 transcript="...te en la respiración o simplemente para encontrar un poco de calma. Tú me dices." audioBytes=756000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para encontrar un poco de calma. Tú me dices.", appendText="<null>", markCompleted=false at 2025-10-05T13:40:37.483
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:37.484
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:37.484
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:37.485
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:37.486
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:37.490
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:37.491
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=239 transcript="...te en la respiración o simplemente para encontrar un poco de calma. Tú me dices." audioBytes=782400 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=26400
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para encontrar un poco de calma. Tú me dices.", appendText="<null>", markCompleted=false at 2025-10-05T13:40:37.520
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWDfaQRyVcEQsW9GNeq chunkBytes=26400
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:37.521
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:37.521
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:37.522
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:37.523
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:37.524
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:37.525
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=239 transcript="...te en la respiración o simplemente para encontrar un poco de calma. Tú me dices." audioBytes=782400 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para encontrar un poco de calma. Tú me dices.", appendText="<null>", markCompleted=false at 2025-10-05T13:40:37.533
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=streaming at 2025-10-05T13:40:37.533
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation item completed role=assistant text="<empty>" transcriptLen=239 transcript="...te en la respiración o simplemente para encontrar un poco de calma. Tú me dices." audioBytes=782400 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWDfaQRyVcEQsW9GNeq, initialText="Qué bueno que todo se escuche bien. ¿Hay algún tipo de meditación o enfoque en particular que te gustaría practicar hoy? Puede ser algo para relajarte, enfocarte en la respiración o simplemente para encontrar un poco de calma. Tú me dices.", appendText="<null>", markCompleted=true at 2025-10-05T13:40:37.534
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Qué bueno que todo se escuche ..." -> new content="Qué bueno que todo se escuche ...", status=completed
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWDfaQRyVcEQsW9GNeq
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=streaming at 2025-10-05T13:40:37.534
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:37.535
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche bien. ¿Hay algún tip...", isUser=false, status=completed at 2025-10-05T13:40:37.535
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:37.535
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo se escuche ...", isUser=false, status=completed at 2025-10-05T13:40:37.536
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWDfaQRyVcEQsW9GNeq in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 4
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Qué bueno que todo se escuche ..." -> "Qué bueno que todo se escuche ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:37.536
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:37.537
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:37.540
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:37.541
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
flutter_soloud.SoLoud: SEVERE: stop() takes too much time for handle 4097. This is not expected but not blocking. Worth to file a bug with a simple reproducible code.
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=0 transcript="<empty>" audioBytes=0 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFW5pxn31WpIYBFLqyzC, initialText="<null>", appendText="<null>", markCompleted=false at 2025-10-05T13:40:39.563
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="Sí, te escucho perfectamente. ..." -> new content="Sí, te escucho perfectamente. ...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFW5pxn31WpIYBFLqyzC
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ¿Cómo te gustaría em...", isUser=false, status=streaming at 2025-10-05T13:40:39.564
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfectamente. ...", isUser=false, status=streaming at 2025-10-05T13:40:39.564
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFW5pxn31WpIYBFLqyzC in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 1
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "Sí, te escucho perfectamente. ..." -> "Sí, te escucho perfectamente. ..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 5
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 5 messages at 2025-10-05T13:40:39.565
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:39.565
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 5 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:39.576
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 5 messages at 2025-10-05T13:40:39.577
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Voice Assistant/AssistantBloc Streaming] Stopping streaming recorder
[Voice Assistant/Audio Recorder] RealAudioRecorder: stopStreaming()
[Voice Assistant/Audio Recorder] RealAudioRecorder: stream done (mode=_RecorderMode.streaming)
[Voice Assistant/AssistantBloc Response] Requesting response after streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=0 transcript="<empty>" audioBytes=0 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="<null>", appendText="<null>", markCompleted=false at 2025-10-05T13:40:40.940
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation item appended role=assistant text="<empty>" transcriptLen=0 transcript="<empty>" audioBytes=0 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="<null>", appendText="<null>", markCompleted=false at 2025-10-05T13:40:40.941
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=1 transcript="O" audioBytes=0 deltaTextLen=0 deltaTranscriptLen=1 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O", appendText="O", markCompleted=false at 2025-10-05T13:40:40.955
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Creating new assistant message: content="O", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Added new assistant message to list (index=4)
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O", isUser=false, status=streaming at 2025-10-05T13:40:40.957
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O", isUser=false, status=streaming at 2025-10-05T13:40:40.957
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 5 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc Message Processing] ChatBloc - NOT FOUND: Adding new message to list
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:40.961
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:40.962
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:40.965
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:40.967
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=9 transcript="O también" audioBytes=0 deltaTextLen=0 deltaTranscriptLen=8 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también", appendText=" también", markCompleted=false at 2025-10-05T13:40:40.987
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O" -> new content="O también también", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también también", isUser=false, status=streaming at 2025-10-05T13:40:40.988
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también también", isUser=false, status=streaming at 2025-10-05T13:40:40.988
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O" -> "O también también"
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:40.989
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:40.990
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=10 transcript="O también," audioBytes=0 deltaTextLen=0 deltaTranscriptLen=1 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también,", appendText=",", markCompleted=false at 2025-10-05T13:40:40.991
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también también" -> new content="O también,,", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también,,", isUser=false, status=streaming at 2025-10-05T13:40:40.992
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también,,", isUser=false, status=streaming at 2025-10-05T13:40:40.992
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también también"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también también" -> "O también,,"
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:40.993
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:40.993
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:40.995
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:40.996
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también,,", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=10 transcript="O también," audioBytes=4800 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=4800
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también,", appendText="<null>", markCompleted=false at 2025-10-05T13:40:41.074
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también,," -> new content="O también,", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=4800
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también,", isUser=false, status=streaming at 2025-10-05T13:40:41.076
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también,", isUser=false, status=streaming at 2025-10-05T13:40:41.076
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también,,"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también,," -> "O también,"
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.077
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.078
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:41.081
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:41.082
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también,", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=10 transcript="O también," audioBytes=12000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=7200
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también,", appendText="<null>", markCompleted=false at 2025-10-05T13:40:41.132
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también," -> new content="O también,", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=7200
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también,", isUser=false, status=streaming at 2025-10-05T13:40:41.134
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también,", isUser=false, status=streaming at 2025-10-05T13:40:41.134
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también,"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también," -> "O también,"
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.136
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.136
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:41.146
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:41.147
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también,", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=10 transcript="O también," audioBytes=24000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también,", appendText="<null>", markCompleted=false at 2025-10-05T13:40:41.231
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también," -> new content="O también,", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también,", isUser=false, status=streaming at 2025-10-05T13:40:41.232
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también,", isUser=false, status=streaming at 2025-10-05T13:40:41.233
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también,"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también," -> "O también,"
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.233
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.234
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=13 transcript="O también, si" audioBytes=24000 deltaTextLen=0 deltaTranscriptLen=3 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si", appendText=" si", markCompleted=false at 2025-10-05T13:40:41.235
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también," -> new content="O también, si si", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si si", isUser=false, status=streaming at 2025-10-05T13:40:41.236
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si si", isUser=false, status=streaming at 2025-10-05T13:40:41.236
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también,"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también," -> "O también, si si"
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.237
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.237
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=18 transcript="O también, si pref" audioBytes=24000 deltaTextLen=0 deltaTranscriptLen=5 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si pref", appendText=" pref", markCompleted=false at 2025-10-05T13:40:41.238
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si si" -> new content="O también, si pref pref", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si pref pref", isUser=false, status=streaming at 2025-10-05T13:40:41.238
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si pref pref", isUser=false, status=streaming at 2025-10-05T13:40:41.238
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si si"
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si si" -> "O también, si pref pref"
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.239
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.239
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=23 transcript="O también, si prefieres" audioBytes=24000 deltaTextLen=0 deltaTranscriptLen=5 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres", appendText="ieres", markCompleted=false at 2025-10-05T13:40:41.241
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si pref pref" -> new content="O también, si prefieresieres", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieresieres", isUser=false, status=streaming at 2025-10-05T13:40:41.242
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieresieres", isUser=false, status=streaming at 2025-10-05T13:40:41.243
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si pref p..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si pref pref" -> "O también, si prefieresieres"
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.244
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.244
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=24 transcript="O también, si prefieres," audioBytes=24000 deltaTextLen=0 deltaTranscriptLen=1 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres,", appendText=",", markCompleted=false at 2025-10-05T13:40:41.245
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieresieres" -> new content="O también, si prefieres,,", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres,,", isUser=false, status=streaming at 2025-10-05T13:40:41.246
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres,,", isUser=false, status=streaming at 2025-10-05T13:40:41.246
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieresieres" -> "O también, si prefieres,,"
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.247
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.247
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:41.250
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:41.250
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres,,", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=24 transcript="O también, si prefieres," audioBytes=36000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres,", appendText="<null>", markCompleted=false at 2025-10-05T13:40:41.291
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres,," -> new content="O también, si prefieres,", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres,", isUser=false, status=streaming at 2025-10-05T13:40:41.292
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres,", isUser=false, status=streaming at 2025-10-05T13:40:41.292
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres,," -> "O también, si prefieres,"
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.294
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.294
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=24 transcript="O también, si prefieres," audioBytes=48000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres,", appendText="<null>", markCompleted=false at 2025-10-05T13:40:41.308
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres," -> new content="O también, si prefieres,", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres,", isUser=false, status=streaming at 2025-10-05T13:40:41.309
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres,", isUser=false, status=streaming at 2025-10-05T13:40:41.309
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres," -> "O también, si prefieres,"
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.310
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.311
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=30 transcript="O también, si prefieres, puedo" audioBytes=48000 deltaTextLen=0 deltaTranscriptLen=6 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo", appendText=" puedo", markCompleted=false at 2025-10-05T13:40:41.312
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres," -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo puedo", isUser=false, status=streaming at 2025-10-05T13:40:41.312
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:41.312
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres," -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.313
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.313
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:41.314
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:41.315
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=33 transcript="O también, si prefieres, puedo gu" audioBytes=48000 deltaTextLen=0 deltaTranscriptLen=3 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo gu", appendText=" gu", markCompleted=false at 2025-10-05T13:40:41.323
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo gu gu", isUser=false, status=streaming at 2025-10-05T13:40:41.324
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:41.324
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.325
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.325
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:41.326
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:41.327
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=33 transcript="O también, si prefieres, puedo gu" audioBytes=60000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo gu", appendText="<null>", markCompleted=false at 2025-10-05T13:40:41.348
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo gu", isUser=false, status=streaming at 2025-10-05T13:40:41.349
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:41.349
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.350
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.350
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:41.361
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:41.362
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=33 transcript="O también, si prefieres, puedo gu" audioBytes=72000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo gu", appendText="<null>", markCompleted=false at 2025-10-05T13:40:41.407
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo gu", isUser=false, status=streaming at 2025-10-05T13:40:41.408
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:41.408
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.409
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.410
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:41.412
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:41.412
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=33 transcript="O también, si prefieres, puedo gu" audioBytes=84000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo gu", appendText="<null>", markCompleted=false at 2025-10-05T13:40:41.420
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo gu", isUser=false, status=streaming at 2025-10-05T13:40:41.421
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:41.421
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.423
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.424
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=36 transcript="O también, si prefieres, puedo guiar" audioBytes=84000 deltaTextLen=0 deltaTranscriptLen=3 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiar", appendText="iar", markCompleted=false at 2025-10-05T13:40:41.425
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiariar", isUser=false, status=streaming at 2025-10-05T13:40:41.425
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:41.425
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.426
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.426
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:41.428
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:41.428
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=38 transcript="O también, si prefieres, puedo guiarte" audioBytes=84000 deltaTextLen=0 deltaTranscriptLen=2 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte", appendText="te", markCompleted=false at 2025-10-05T13:40:41.437
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiartete", isUser=false, status=streaming at 2025-10-05T13:40:41.438
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:41.438
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.439
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.439
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=42 transcript="O también, si prefieres, puedo guiarte por" audioBytes=84000 deltaTextLen=0 deltaTranscriptLen=4 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por", appendText=" por", markCompleted=false at 2025-10-05T13:40:41.440
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por por", isUser=false, status=streaming at 2025-10-05T13:40:41.441
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:41.441
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.442
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.442
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:41.443
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:41.444
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=46 transcript="O también, si prefieres, puedo guiarte por una" audioBytes=84000 deltaTextLen=0 deltaTranscriptLen=4 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una", appendText=" una", markCompleted=false at 2025-10-05T13:40:41.453
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una una", isUser=false, status=streaming at 2025-10-05T13:40:41.453
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:41.453
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.454
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.454
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:41.460
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:41.461
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=54 transcript="O también, si prefieres, puedo guiarte por una pequeña" audioBytes=84000 deltaTextLen=0 deltaTranscriptLen=8 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña", appendText=" pequeña", markCompleted=false at 2025-10-05T13:40:41.470
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:41.470
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:41.471
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.472
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.472
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=58 transcript="O también, si prefieres, puedo guiarte por una pequeña med" audioBytes=84000 deltaTextLen=0 deltaTranscriptLen=4 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña med", appendText=" med", markCompleted=false at 2025-10-05T13:40:41.474
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:41.475
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:41.475
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.477
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.477
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=65 transcript="O también, si prefieres, puedo guiarte por una pequeña meditación" audioBytes=84000 deltaTextLen=0 deltaTranscriptLen=7 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación", appendText="itación", markCompleted=false at 2025-10-05T13:40:41.479
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:41.479
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:41.480
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.481
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.482
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:41.484
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:41.485
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=65 transcript="O también, si prefieres, puedo guiarte por una pequeña meditación" audioBytes=96000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación", appendText="<null>", markCompleted=false at 2025-10-05T13:40:41.523
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:41.524
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:41.524
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.525
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.526
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:41.528
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:41.529
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=65 transcript="O también, si prefieres, puedo guiarte por una pequeña meditación" audioBytes=108000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación", appendText="<null>", markCompleted=false at 2025-10-05T13:40:41.563
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:41.564
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:41.564
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.565
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.566
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:41.577
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:41.578
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=65 transcript="O también, si prefieres, puedo guiarte por una pequeña meditación" audioBytes=120000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación", appendText="<null>", markCompleted=false at 2025-10-05T13:40:41.611
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:41.612
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:41.613
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.614
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.614
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:41.627
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:41.628
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=65 transcript="O también, si prefieres, puedo guiarte por una pequeña meditación" audioBytes=132000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación", appendText="<null>", markCompleted=false at 2025-10-05T13:40:41.637
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:41.638
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:41.638
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.639
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.640
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:41.644
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:41.645
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=65 transcript="O también, si prefieres, puedo guiarte por una pequeña meditación" audioBytes=144000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación", appendText="<null>", markCompleted=false at 2025-10-05T13:40:41.688
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:41.688
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:41.689
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.690
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.691
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:41.695
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:41.695
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=65 transcript="O también, si prefieres, puedo guiarte por una pequeña meditación" audioBytes=156000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación", appendText="<null>", markCompleted=false at 2025-10-05T13:40:41.727
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:41.728
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:41.728
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.729
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.729
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:41.732
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:41.732
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=68 transcript="O también, si prefieres, puedo guiarte por una pequeña meditación de" audioBytes=156000 deltaTextLen=0 deltaTranscriptLen=3 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de", appendText=" de", markCompleted=false at 2025-10-05T13:40:41.742
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:41.742
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:41.742
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.743
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.744
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:41.746
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:41.747
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=77 transcript="O también, si prefieres, puedo guiarte por una pequeña meditación de atención" audioBytes=156000 deltaTextLen=0 deltaTranscriptLen=9 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención", appendText=" atención", markCompleted=false at 2025-10-05T13:40:41.764
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:41.765
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:41.765
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.766
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.766
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:41.769
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:41.770
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=83 transcript="...ambién, si prefieres, puedo guiarte por una pequeña meditación de atención plena" audioBytes=156000 deltaTextLen=0 deltaTranscriptLen=6 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena", appendText=" plena", markCompleted=false at 2025-10-05T13:40:41.780
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:41.781
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:41.781
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.782
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.782
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=87 transcript="...én, si prefieres, puedo guiarte por una pequeña meditación de atención plena que" audioBytes=156000 deltaTextLen=0 deltaTranscriptLen=4 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que", appendText=" que", markCompleted=false at 2025-10-05T13:40:41.783
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:41.783
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:41.783
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.784
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.784
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=90 transcript="... si prefieres, puedo guiarte por una pequeña meditación de atención plena que te" audioBytes=156000 deltaTextLen=0 deltaTranscriptLen=3 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te", appendText=" te", markCompleted=false at 2025-10-05T13:40:41.786
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:41.786
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:41.786
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.787
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.787
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:41.790
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:41.790
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=93 transcript="... prefieres, puedo guiarte por una pequeña meditación de atención plena que te ay" audioBytes=156000 deltaTextLen=0 deltaTranscriptLen=3 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ay", appendText=" ay", markCompleted=false at 2025-10-05T13:40:41.800
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:41.800
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:41.800
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.801
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.801
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=96 transcript="...efieres, puedo guiarte por una pequeña meditación de atención plena que te ayude" audioBytes=156000 deltaTextLen=0 deltaTranscriptLen=3 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude", appendText="ude", markCompleted=false at 2025-10-05T13:40:41.802
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:41.802
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:41.803
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.803
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.803
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=98 transcript="...ieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a" audioBytes=156000 deltaTextLen=0 deltaTranscriptLen=2 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a", appendText=" a", markCompleted=false at 2025-10-05T13:40:41.804
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:41.805
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:41.805
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.806
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.806
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:41.808
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:41.809
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=107 transcript="...edo guiarte por una pequeña meditación de atención plena que te ayude a conectar" audioBytes=156000 deltaTextLen=0 deltaTranscriptLen=9 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar", appendText=" conectar", markCompleted=false at 2025-10-05T13:40:41.819
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:41.820
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:41.820
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.821
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.821
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:41.824
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:41.825
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=107 transcript="...edo guiarte por una pequeña meditación de atención plena que te ayude a conectar" audioBytes=168000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar", appendText="<null>", markCompleted=false at 2025-10-05T13:40:41.858
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:41.859
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:41.859
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.860
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.861
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:41.863
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:41.863
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=107 transcript="...edo guiarte por una pequeña meditación de atención plena que te ayude a conectar" audioBytes=180000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar", appendText="<null>", markCompleted=false at 2025-10-05T13:40:41.885
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:41.886
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:41.887
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.888
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.889
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:41.894
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:41.895
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=107 transcript="...edo guiarte por una pequeña meditación de atención plena que te ayude a conectar" audioBytes=192000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar", appendText="<null>", markCompleted=false at 2025-10-05T13:40:41.922
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:41.923
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:41.923
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.924
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.924
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:41.926
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:41.926
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=107 transcript="...edo guiarte por una pequeña meditación de atención plena que te ayude a conectar" audioBytes=204000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar", appendText="<null>", markCompleted=false at 2025-10-05T13:40:41.967
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:41.968
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:41.968
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:41.969
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:41.970
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:41.977
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:41.978
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=107 transcript="...edo guiarte por una pequeña meditación de atención plena que te ayude a conectar" audioBytes=216000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar", appendText="<null>", markCompleted=false at 2025-10-05T13:40:41.999
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.000
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.000
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.001
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.001
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:42.011
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:42.011
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=107 transcript="...edo guiarte por una pequeña meditación de atención plena que te ayude a conectar" audioBytes=228000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar", appendText="<null>", markCompleted=false at 2025-10-05T13:40:42.043
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.048
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.049
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.055
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.056
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Voice Assistant/AssistantBloc Mode] Streaming mode set to false
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:42.074
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:42.076
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=107 transcript="...edo guiarte por una pequeña meditación de atención plena que te ayude a conectar" audioBytes=240000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar", appendText="<null>", markCompleted=false at 2025-10-05T13:40:42.122
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.123
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.123
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.124
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.125
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=107 transcript="...edo guiarte por una pequeña meditación de atención plena que te ayude a conectar" audioBytes=252000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar", appendText="<null>", markCompleted=false at 2025-10-05T13:40:42.127
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.128
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.129
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.130
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.131
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:42.134
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:42.134
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=107 transcript="...edo guiarte por una pequeña meditación de atención plena que te ayude a conectar" audioBytes=264000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar", appendText="<null>", markCompleted=false at 2025-10-05T13:40:42.166
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.167
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.167
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.168
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.169
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=111 transcript="...guiarte por una pequeña meditación de atención plena que te ayude a conectar con" audioBytes=264000 deltaTextLen=0 deltaTranscriptLen=4 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar con", appendText=" con", markCompleted=false at 2025-10-05T13:40:42.170
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.170
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.170
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.171
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.171
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=114 transcript="...arte por una pequeña meditación de atención plena que te ayude a conectar con el" audioBytes=264000 deltaTextLen=0 deltaTranscriptLen=3 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar con el", appendText=" el", markCompleted=false at 2025-10-05T13:40:42.172
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.173
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.173
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.173
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.173
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=122 transcript="... una pequeña meditación de atención plena que te ayude a conectar con el momento" audioBytes=264000 deltaTextLen=0 deltaTranscriptLen=8 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar con el momento", appendText=" momento", markCompleted=false at 2025-10-05T13:40:42.174
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.175
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.175
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.176
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.176
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:42.179
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:42.179
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=131 transcript="...eña meditación de atención plena que te ayude a conectar con el momento presente" audioBytes=264000 deltaTextLen=0 deltaTranscriptLen=9 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar con el momento presente", appendText=" presente", markCompleted=false at 2025-10-05T13:40:42.198
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.198
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.198
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.199
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.199
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=132 transcript="...ña meditación de atención plena que te ayude a conectar con el momento presente." audioBytes=264000 deltaTextLen=0 deltaTranscriptLen=1 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar con el momento presente.", appendText=".", markCompleted=false at 2025-10-05T13:40:42.201
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.201
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.201
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.202
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.202
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=134 transcript="... meditación de atención plena que te ayude a conectar con el momento presente. ¿" audioBytes=264000 deltaTextLen=0 deltaTranscriptLen=2 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar con el momento presente. ¿", appendText=" ¿", markCompleted=false at 2025-10-05T13:40:42.204
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.204
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.204
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.205
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.205
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:42.212
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:42.212
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=137 transcript="...ditación de atención plena que te ayude a conectar con el momento presente. ¿Hay" audioBytes=264000 deltaTextLen=0 deltaTranscriptLen=3 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar con el momento presente. ¿Hay", appendText="Hay", markCompleted=false at 2025-10-05T13:40:42.224
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.224
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.224
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.225
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.225
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:42.227
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:42.228
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=137 transcript="...ditación de atención plena que te ayude a conectar con el momento presente. ¿Hay" audioBytes=276000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar con el momento presente. ¿Hay", appendText="<null>", markCompleted=false at 2025-10-05T13:40:42.270
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.271
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.271
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.272
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.273
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:42.278
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:42.279
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=137 transcript="...ditación de atención plena que te ayude a conectar con el momento presente. ¿Hay" audioBytes=288000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar con el momento presente. ¿Hay", appendText="<null>", markCompleted=false at 2025-10-05T13:40:42.315
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.316
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.316
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.317
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.318
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:42.328
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:42.328
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=137 transcript="...ditación de atención plena que te ayude a conectar con el momento presente. ¿Hay" audioBytes=300000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar con el momento presente. ¿Hay", appendText="<null>", markCompleted=false at 2025-10-05T13:40:42.348
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.349
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.349
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.350
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.351
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:42.360
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:42.361
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=137 transcript="...ditación de atención plena que te ayude a conectar con el momento presente. ¿Hay" audioBytes=312000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar con el momento presente. ¿Hay", appendText="<null>", markCompleted=false at 2025-10-05T13:40:42.383
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.383
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.384
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.385
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.385
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:42.395
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:42.396
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=137 transcript="...ditación de atención plena que te ayude a conectar con el momento presente. ¿Hay" audioBytes=324000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar con el momento presente. ¿Hay", appendText="<null>", markCompleted=false at 2025-10-05T13:40:42.421
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.422
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.422
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.423
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.423
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:42.427
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:42.429
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=137 transcript="...ditación de atención plena que te ayude a conectar con el momento presente. ¿Hay" audioBytes=336000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar con el momento presente. ¿Hay", appendText="<null>", markCompleted=false at 2025-10-05T13:40:42.467
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.468
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.468
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.470
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.470
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:42.478
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:42.479
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=137 transcript="...ditación de atención plena que te ayude a conectar con el momento presente. ¿Hay" audioBytes=348000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar con el momento presente. ¿Hay", appendText="<null>", markCompleted=false at 2025-10-05T13:40:42.505
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.506
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.507
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.508
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.508
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:42.511
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:42.512
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=137 transcript="...ditación de atención plena que te ayude a conectar con el momento presente. ¿Hay" audioBytes=360000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar con el momento presente. ¿Hay", appendText="<null>", markCompleted=false at 2025-10-05T13:40:42.544
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.545
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.545
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.547
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.547
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:42.550
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:42.551
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=137 transcript="...ditación de atención plena que te ayude a conectar con el momento presente. ¿Hay" audioBytes=372000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar con el momento presente. ¿Hay", appendText="<null>", markCompleted=false at 2025-10-05T13:40:42.580
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.581
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.582
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.583
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.583
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=143 transcript="...ón de atención plena que te ayude a conectar con el momento presente. ¿Hay algún" audioBytes=372000 deltaTextLen=0 deltaTranscriptLen=6 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar con el momento presente. ¿Hay algún", appendText=" algún", markCompleted=false at 2025-10-05T13:40:42.584
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.584
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.585
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.586
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.586
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:42.595
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:42.596
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=149 transcript="...atención plena que te ayude a conectar con el momento presente. ¿Hay algún lugar" audioBytes=372000 deltaTextLen=0 deltaTranscriptLen=6 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar con el momento presente. ¿Hay algún lugar", appendText=" lugar", markCompleted=false at 2025-10-05T13:40:42.606
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.606
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.606
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.607
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.607
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=151 transcript="...ención plena que te ayude a conectar con el momento presente. ¿Hay algún lugar o" audioBytes=372000 deltaTextLen=0 deltaTranscriptLen=2 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar con el momento presente. ¿Hay algún lugar o", appendText=" o", markCompleted=false at 2025-10-05T13:40:42.608
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.609
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.609
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.610
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.610
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=161 transcript="...na que te ayude a conectar con el momento presente. ¿Hay algún lugar o situación" audioBytes=372000 deltaTextLen=0 deltaTranscriptLen=10 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar con el momento presente. ¿Hay algún lugar o situación", appendText=" situación", markCompleted=false at 2025-10-05T13:40:42.612
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.612
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.613
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.614
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.614
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:42.617
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:42.618
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=165 transcript="...ue te ayude a conectar con el momento presente. ¿Hay algún lugar o situación que" audioBytes=372000 deltaTextLen=0 deltaTranscriptLen=4 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar con el momento presente. ¿Hay algún lugar o situación que", appendText=" que", markCompleted=false at 2025-10-05T13:40:42.629
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.629
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.629
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.630
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.630
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:42.633
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:42.633
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=168 transcript="...te ayude a conectar con el momento presente. ¿Hay algún lugar o situación que te" audioBytes=372000 deltaTextLen=0 deltaTranscriptLen=3 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar con el momento presente. ¿Hay algún lugar o situación que te", appendText=" te", markCompleted=false at 2025-10-05T13:40:42.644
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.644
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.645
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.645
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.645
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=177 transcript="...a conectar con el momento presente. ¿Hay algún lugar o situación que te gustaría" audioBytes=372000 deltaTextLen=0 deltaTranscriptLen=9 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar con el momento presente. ¿Hay algún lugar o situación que te gustaría", appendText=" gustaría", markCompleted=false at 2025-10-05T13:40:42.647
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.647
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.647
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.648
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.648
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:42.650
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:42.652
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=184 transcript="...tar con el momento presente. ¿Hay algún lugar o situación que te gustaría visual" audioBytes=372000 deltaTextLen=0 deltaTranscriptLen=7 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar con el momento presente. ¿Hay algún lugar o situación que te gustaría visual", appendText=" visual", markCompleted=false at 2025-10-05T13:40:42.662
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.662
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.662
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.663
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.663
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:42.666
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:42.666
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=184 transcript="...tar con el momento presente. ¿Hay algún lugar o situación que te gustaría visual" audioBytes=384000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar con el momento presente. ¿Hay algún lugar o situación que te gustaría visual", appendText="<null>", markCompleted=false at 2025-10-05T13:40:42.699
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.700
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.700
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.701
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.702
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
flutter_soloud.SoLoud: SEVERE: stop() takes too much time for handle 8193. This is not expected but not blocking. Worth to file a bug with a simple reproducible code.
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:42.712
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:42.713
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=184 transcript="...tar con el momento presente. ¿Hay algún lugar o situación que te gustaría visual" audioBytes=396000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar con el momento presente. ¿Hay algún lugar o situación que te gustaría visual", appendText="<null>", markCompleted=false at 2025-10-05T13:40:42.743
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.744
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.745
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.746
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
flutter_soloud.SoLoud: SEVERE: addAudioDataStream() result: PlayerErrors.streamEndedAlready (Trying to add PCM data but the stream is marked to be ended already, by the user or when the stream reached its maximum capacity, in this case the stream is automatically marked to be ended.)
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.747
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:42.750
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:42.750
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=184 transcript="...tar con el momento presente. ¿Hay algún lugar o situación que te gustaría visual" audioBytes=408000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar con el momento presente. ¿Hay algún lugar o situación que te gustaría visual", appendText="<null>", markCompleted=false at 2025-10-05T13:40:42.783
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.784
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.784
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.786
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.786
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:42.795
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:42.796
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=184 transcript="...tar con el momento presente. ¿Hay algún lugar o situación que te gustaría visual" audioBytes=420000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar con el momento presente. ¿Hay algún lugar o situación que te gustaría visual", appendText="<null>", markCompleted=false at 2025-10-05T13:40:42.820
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.821
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.821
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.822
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.823
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:42.828
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:42.829
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=184 transcript="...tar con el momento presente. ¿Hay algún lugar o situación que te gustaría visual" audioBytes=432000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=12000
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar con el momento presente. ¿Hay algún lugar o situación que te gustaría visual", appendText="<null>", markCompleted=false at 2025-10-05T13:40:42.858
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/Chat Assistant OpenAI] OpenAI audio chunk received: item=item_CNFWKZYzS8xAzD9P5fYM3 chunkBytes=12000
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.859
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.859
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.860
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.860
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:42.862
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:42.862
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=184 transcript="...tar con el momento presente. ¿Hay algún lugar o situación que te gustaría visual" audioBytes=432000 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="O también, si prefieres, puedo guiarte por una pequeña meditación de atención plena que te ayude a conectar con el momento presente. ¿Hay algún lugar o situación que te gustaría visual", appendText="<null>", markCompleted=false at 2025-10-05T13:40:42.904
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.905
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.905
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.905
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.906
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=0 transcript="<empty>" audioBytes=0 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="<null>", appendText="<null>", markCompleted=false at 2025-10-05T13:40:42.907
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:42.908
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:42.908
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:42.909
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:42.909
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:42.911
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:42.912
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
flutter_soloud.SoLoud: SEVERE: stop() takes too much time for handle 16385. This is not expected but not blocking. Worth to file a bug with a simple reproducible code.
[Voice Assistant/Voice Assistant Repository OpenAI] OpenAI conversation updated role=assistant text="<empty>" transcriptLen=0 transcript="<empty>" audioBytes=0 deltaTextLen=0 deltaTranscriptLen=0 deltaAudioBytes=0
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - _upsertAssistantMessage: messageId=item_CNFWKZYzS8xAzD9P5fYM3, initialText="<null>", appendText="<null>", markCompleted=false at 2025-10-05T13:40:44.075
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updating existing assistant message: old content="O también, si prefieres, puedo..." -> new content="O también, si prefieres, puedo...", status=streaming
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message at index 4
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Emitting updated assistant message to stream: id=item_CNFWKZYzS8xAzD9P5fYM3
[Voice Assistant/Voice Assistant Repository Assistant Message] VoiceAssistantRepository - Updated assistant message emitted, stream closed: false
[Chat/ChatBloc Stream] ChatBloc - Message received from stream: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo guiarte por una peq...", isUser=false, status=streaming at 2025-10-05T13:40:44.075
[Chat/ChatBloc Stream] ChatBloc - MESSAGE STREAM RECEIVED: id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefieres, puedo...", isUser=false, status=streaming at 2025-10-05T13:40:44.076
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING START: About to process ASSISTANT message for UI display
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Looking for message id=item_CNFWKZYzS8xAzD9P5fYM3 in 6 existing messages
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 0 - id=welcome-1759657163360, content="Hello! I'm your medi..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, content="Sí, te escucho perfe..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, content="Do you hear me?"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 3 - id=1759657233802, content="Nice"
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, content="Qué bueno que todo s..."
[Chat/ChatBloc - SYNC CHECK] ChatBloc - SYNC CHECK: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, content="O también, si prefie..."
[Chat/ChatBloc Message Processing] ChatBloc - FOUND EXISTING: Updating message at index 5
[Chat/ChatBloc Message Processing] ChatBloc - Message updated: "O también, si prefieres, puedo..." -> "O también, si prefieres, puedo..."
[Chat/ChatBloc Message Processing] ChatBloc - Total messages in list: 6
[Chat/ChatBloc Message Processing] ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with 6 messages at 2025-10-05T13:40:44.077
[Chat/ChatBloc UI] ChatBloc - UI UPDATE: Chat UI should now display the updated message list
[Chat/Chat Assistant State] ChatAssistantWidget - ChatBloc state changed: ChatConnected at 2025-10-05T13:40:44.077
[Chat/Chat Assistant State] ChatAssistantWidget - State contains 6 messages
[Chat/Chat Widget UI] [ChatWidget] UI REBUILD: State changed to ChatConnected at 2025-10-05T13:40:44.081
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: About to render 6 messages at 2025-10-05T13:40:44.082
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 0 - id=welcome-1759657163360, isUser=false, content="Hello! I'm your meditation ass...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 1 - id=item_CNFW5pxn31WpIYBFLqyzC, isUser=false, content="Sí, te escucho perfectamente. ...", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 2 - id=item_CNFW5OvDTRv0zYqGICBxM, isUser=true, content="Do you hear me?", status=streaming
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 3 - id=1759657233802, isUser=true, content="Nice", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 4 - id=item_CNFWDfaQRyVcEQsW9GNeq, isUser=false, content="Qué bueno que todo se escuche ...", status=completed
[Chat/Chat Widget UI] [ChatWidget] UI RENDER: Index 5 - id=item_CNFWKZYzS8xAzD9P5fYM3, isUser=false, content="O también, si prefieres, puedo...", status=streaming
