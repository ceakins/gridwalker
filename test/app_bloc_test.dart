import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gridwalker/core/bloc/app_bloc.dart';
import 'package:gridwalker/core/bloc/app_event.dart';
import 'package:gridwalker/data/repositories/isar_repository.dart';
import 'package:gridwalker/data/repositories/settings_repository.dart';
import 'package:gridwalker/features/tracking/tracking_service.dart';
import 'package:gridwalker/features/sync/github_sync_service.dart';

import 'package:geolocator/geolocator.dart';
import 'package:gridwalker/data/local/grid_cell.dart';

class MockSecureStorage extends Fake implements FlutterSecureStorage {
  final Map<String, String> storage = {};
  @override
  Future<String?> read({required String key, IOSOptions? iOptions, AndroidOptions? aOptions, LinuxOptions? lOptions, WebOptions? webOptions, MacOSOptions? mOptions, WindowsOptions? wOptions}) async => storage[key];
  @override
  Future<void> write({required String key, required String? value, IOSOptions? iOptions, AndroidOptions? aOptions, LinuxOptions? lOptions, WebOptions? webOptions, MacOSOptions? mOptions, WindowsOptions? wOptions}) async { if (value != null) storage[key] = value; }
  @override
  Future<void> delete({required String key, IOSOptions? iOptions, AndroidOptions? aOptions, LinuxOptions? lOptions, WebOptions? webOptions, MacOSOptions? mOptions, WindowsOptions? wOptions}) async { storage.remove(key); }
}

class MockIsarRepository extends Fake implements IsarRepository {}
class MockTrackingService extends Fake implements TrackingService {
  @override
  Stream<Position> get positionStream => Stream.empty();
  @override
  Stream<List<GridCell>> get gridStream => Stream.empty();
}
class MockGitHubSyncService extends Fake implements GitHubSyncService {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('AppBloc', () {
    late AppBloc bloc;
    late SettingsRepository settingsRepository;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();
      settingsRepository = SettingsRepository(prefs, MockSecureStorage());
      
      bloc = AppBloc(
        isarRepository: MockIsarRepository(),
        settingsRepository: settingsRepository,
        trackingService: MockTrackingService(),
        syncService: MockGitHubSyncService(),
      );
    });

    tearDown(() {
      bloc.close();
    });

    test('Initial state hasSeenPermissionScreen is false', () {
      expect(bloc.state.hasSeenPermissionScreen, isFalse);
    });

    test('MarkPermissionScreenSeen event updates state and repository', () async {
      bloc.add(MarkPermissionScreenSeen());
      
      // Wait for the event to be processed
      await expectLater(
        bloc.stream,
        emits(predicate((state) => (state as dynamic).hasSeenPermissionScreen == true)),
      );
      
      expect(settingsRepository.hasSeenPermissionScreen, isTrue);
    });
  });
}
