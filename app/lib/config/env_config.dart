class EnvConfig {
  static String get openApiKey {
    const value = String.fromEnvironment('OPENAI_API_KEY');
    if (value.isEmpty) {
      throw Exception(
          'OPENAI_API_KEY not provided. Use --dart-define=OPENAI_API_KEY=<value>');
    }
    return value;
  }

  static String get supabaseUrl {
    const value = String.fromEnvironment('SUPABASE_URL');
    if (value.isEmpty) {
      throw Exception(
          'SUPABASE_URL not provided. Use --dart-define=SUPABASE_URL=<value>');
    }
    return value;
  }

  static String get supabaseAnonKey {
    const value = String.fromEnvironment('SUPABASE_ANON_KEY');
    if (value.isEmpty) {
      throw Exception(
          'SUPABASE_ANON_KEY not provided. Use --dart-define=SUPABASE_ANON_KEY=<value>');
    }
    return value;
  }

  static String get openAiRealtimeModel {
    const value = String.fromEnvironment(
      'OPENAI_REALTIME_MODEL',
      defaultValue: 'gpt-4o-mini-realtime-preview-2024-12-17',
    );
    if (value.isEmpty) {
      return 'gpt-4o-mini-realtime-preview-2024-12-17';
    }
    return value;
  }

  static String get openAiRealtimeLanguage {
    const value = String.fromEnvironment(
      'OPENAI_REALTIME_LANGUAGE',
      defaultValue: 'en',
    );
    if (value.isEmpty) {
      return 'en';
    }
    return value;
  }

  static bool isValid() {
    return supabaseUrl.isNotEmpty && supabaseAnonKey.isNotEmpty;
  }
}
