import 'package:flutter_test/flutter_test.dart';
import 'package:github/github.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gridwalker/main.dart';
import 'package:gridwalker/data/local/grid_cell.dart';
import 'package:gridwalker/data/local/subject_record.dart';
import 'package:gridwalker/data/repositories/isar_repository.dart';
import 'package:gridwalker/data/repositories/settings_repository.dart';
import 'package:gridwalker/features/tracking/tracking_service.dart';
import 'package:gridwalker/features/sync/github_sync_service.dart';

class MockSecureStorage extends Fake implements FlutterSecureStorage {
  @override
  Future<String?> read({required String key, AppleOptions? iOptions, AndroidOptions? aOptions, LinuxOptions? lOptions, WebOptions? webOptions, AppleOptions? mOptions, WindowsOptions? wOptions}) async => null;
  @override
  Future<void> write({required String key, required String? value, AppleOptions? iOptions, AndroidOptions? aOptions, LinuxOptions? lOptions, WebOptions? webOptions, AppleOptions? mOptions, WindowsOptions? wOptions}) async {}
  @override
  Future<void> delete({required String key, AppleOptions? iOptions, AndroidOptions? aOptions, LinuxOptions? lOptions, WebOptions? webOptions, AppleOptions? mOptions, WindowsOptions? wOptions}) async {}
}

class MockIsarRepository extends Fake implements IsarRepository {
  @override
  Future<List<GridCell>> getAllGridCells() async => [];
  @override
  Future<List<SubjectRecord>> getAllMarkers() async => [];
}

class MockTrackingService extends Fake implements TrackingService {
  @override
  Stream<Position> get positionStream => Stream.empty();
  @override
  Stream<List<GridCell>> get gridStream => Stream.empty();
}

class MockGitHubSyncService extends Fake implements GitHubSyncService {}

void main() {
  testWidgets('App starts up correctly', (WidgetTester tester) async {
    // 1. Create stubs for services
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final settingsRepository = SettingsRepository(prefs, MockSecureStorage());
    final isarRepository = MockIsarRepository();
    final trackingService = MockTrackingService();
    final github = GitHub(auth: Authentication.anonymous());
    final syncService = GitHubSyncService(
      github: github,
      owner: 'test',
      repo: 'test',
    );

    // 2. Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(
      isarRepository: isarRepository,
      settingsRepository: settingsRepository,
      trackingService: trackingService,
      syncService: syncService,
    ));

    // 3. Fast-forward through the splash screen timer
    await tester.pump(const Duration(seconds: 6));
    await tester.pumpAndSettle();

    // 4. Verify that the app title is present (now on MapPage)
    expect(find.text('GridWalker SAR'), findsOneWidget);
  });
}
