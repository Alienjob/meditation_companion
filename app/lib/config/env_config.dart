class EnvConfig {
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

  static bool isValid() {
    return supabaseUrl.isNotEmpty && supabaseAnonKey.isNotEmpty;
  }
}
