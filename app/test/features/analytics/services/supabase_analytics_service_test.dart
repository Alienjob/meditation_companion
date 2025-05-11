import 'dart:async';
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:meditation_companion/features/analytics/models/analytics_event.dart';
import 'package:meditation_companion/features/analytics/services/supabase_analytics_service.dart';

// Mock classes
class MockSupabaseClient extends Mock implements SupabaseClient {}

class MockSharedPreferences extends Mock implements SharedPreferences {}

class MockSupabaseQueryBuilder extends Mock implements SupabaseQueryBuilder {}

class MockPostgrestFilterBuilder extends Mock
    implements PostgrestFilterBuilder<List<Map<String, dynamic>>> {
  @override
  Future<List<Map<String, dynamic>>> execute() async {
    return [
      {'id': 'test-session-id'}
    ];
  }

  @override
  Future<T> then<T>(
    FutureOr<T> Function(List<Map<String, dynamic>> value) onValue, {
    Function? onError,
  }) async {
    final result = await execute();
    return await onValue(result);
  }
}

class FailingPostgrestFilterBuilder extends Mock
    implements PostgrestFilterBuilder<List<Map<String, dynamic>>> {
  @override
  Future<List<Map<String, dynamic>>> execute() async {
    throw Exception('Network error');
  }

  @override
  Future<T> then<T>(
    FutureOr<T> Function(List<Map<String, dynamic>> value) onValue, {
    Function? onError,
  }) {
    // This simulates how Dart's await mechanism interacts with a Future
    return Future<List<Map<String, dynamic>>>.error(Exception('Network error'))
        .then(onValue, onError: onError);
  }
}

void main() {
  late SupabaseAnalyticsService service;
  late MockSupabaseClient supabase;
  late MockSharedPreferences prefs;
  late MockSupabaseQueryBuilder queryBuilder;
  late MockPostgrestFilterBuilder filterBuilder;

  setUpAll(() {
    registerFallbackValue(<String, dynamic>{});
    registerFallbackValue(<Map<String, dynamic>>[]);
  });

  setUp(() {
    supabase = MockSupabaseClient();
    prefs = MockSharedPreferences();
    queryBuilder = MockSupabaseQueryBuilder();
    filterBuilder = MockPostgrestFilterBuilder();

    // Basic Supabase mock setup
    when(() => supabase.from(any())).thenAnswer((_) => queryBuilder);
    when(() => queryBuilder.select()).thenAnswer((_) => filterBuilder);
    when(() => queryBuilder.insert(any())).thenAnswer((_) => filterBuilder);
    when(() => queryBuilder.update(any())).thenAnswer((_) => filterBuilder);

    // FilterBuilder responses
    when(() => filterBuilder.eq(any(), any())).thenAnswer((_) => filterBuilder);
    when(() => filterBuilder.limit(any())).thenAnswer((_) => filterBuilder);

    // SharedPreferences mock setup
    when(() => prefs.getString(any())).thenAnswer((_) => null);
    when(() => prefs.setString(any(), any())).thenAnswer((_) async => true);
    when(() => prefs.remove(any())).thenAnswer((_) async => true);

    service = SupabaseAnalyticsService(
      supabase: supabase,
      prefs: prefs,
    );
  });

  tearDown(() {
    service.dispose();
  });

  group('initialization', () {
    test('loads queue from preferences if exists', () async {
      final testQueue = {'events': [], 'maxRetries': 3, 'maxAge': 604800000};

      when(() => prefs.getString(any()))
          .thenAnswer((_) => jsonEncode(testQueue));

      service = SupabaseAnalyticsService(
        supabase: supabase,
        prefs: prefs,
      );

      await service.isReady();
      verify(() => prefs.getString(any())).called(greaterThan(0));
    });
  });

  group('session management', () {
    test('can start new session', () async {
      final sessionId = await service.startSession(
        userId: 'user1',
        deviceInfo: 'test device',
        appVersion: '1.0.0',
      );

      verify(() => supabase.from('app_sessions')).called(1);
      verify(() => queryBuilder.insert(any())).called(1);
      expect(sessionId.isNotEmpty, true);
    });

    test('can end session', () async {
      await service.endSession('test_session');

      verify(() => supabase.from('app_sessions')).called(1);
      verify(() => queryBuilder.update(any())).called(1);
      verify(() => filterBuilder.eq('id', 'test_session')).called(1);
    });
  });

  group('event tracking', () {
    setUp(() {
      // Reset verification counts between tests
      reset(prefs);
      reset(supabase);
      reset(queryBuilder);
      reset(filterBuilder);

      // Re-setup the mocks for each test
      when(() => supabase.from(any())).thenAnswer((_) => queryBuilder);
      when(() => queryBuilder.select()).thenAnswer((_) => filterBuilder);
      when(() => queryBuilder.insert(any())).thenAnswer((_) => filterBuilder);
      when(() => queryBuilder.update(any())).thenAnswer((_) => filterBuilder);
      when(() => filterBuilder.eq(any(), any()))
          .thenAnswer((_) => filterBuilder);
      when(() => filterBuilder.limit(any())).thenAnswer((_) => filterBuilder);
      when(() => prefs.getString(any())).thenAnswer((_) => null);
      when(() => prefs.setString(any(), any())).thenAnswer((_) async => true);
      when(() => prefs.remove(any())).thenAnswer((_) async => true);
    });

    test('queues events locally', () async {
      final event = createTestEvent('1');
      await service.trackEvent(event);

      // Use atLeastOnce() instead of called(1) if multiple calls are expected
      verify(() => prefs.setString(any(), any()))
          .called(greaterThanOrEqualTo(1));
    });

    test('attempts to upload events immediately', () async {
      final event = createTestEvent('1');
      await service.trackEvent(event);

      verify(() => supabase.from('events')).called(greaterThanOrEqualTo(1));
      verify(() => queryBuilder.insert(any())).called(greaterThanOrEqualTo(1));
    });

    test('retains events on upload failure', () async {
      // Create a service with upload timer disabled for testing
      service = SupabaseAnalyticsService(
        supabase: supabase,
        prefs: prefs,
        uploadInterval: null, // Pass null to disable automatic uploads
      );

      final failingFilterBuilder = FailingPostgrestFilterBuilder();

      when(() => queryBuilder.insert(any()))
          .thenAnswer((_) => failingFilterBuilder);

      final event = createTestEvent('1');

      print('Tracking event: ${event.id}');
      try {
        await service.trackEvent(event);
      } catch (e) {
        print('Exception caught: $e');
      }

      verify(() => prefs.setString(any(), any()))
          .called(greaterThanOrEqualTo(1));
    }, timeout: Timeout(Duration(seconds: 3)));
  });

  group('batch upload', () {
    test('respects max batch size', () async {
      // Add multiple events
      for (var i = 0; i < 100; i++) {
        await service.trackEvent(createTestEvent(i.toString()));
      }

      await service.uploadPendingEvents();

      final captured = verify(() => queryBuilder.insert(captureAny())).captured;

      // Convert to list if it's an iterable
      final insertedData = captured.first;
      final dataLength = insertedData is Iterable
          ? insertedData.length
          : (insertedData as List).length;

      expect(dataLength, lessThanOrEqualTo(50));
    });
  });
}

AnalyticsEvent createTestEvent(String id) {
  return AnalyticsEvent(
    id: id,
    userId: 'test_user',
    timestamp: DateTime.now(),
    eventType: 'test.event',
    parameters: {'test': 'value'},
  );
}
