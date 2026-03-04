import 'package:flutter_test/flutter_test.dart';
import 'package:github/github.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gridwalker/main.dart';
import 'package:gridwalker/data/repositories/isar_repository.dart';
import 'package:gridwalker/data/repositories/settings_repository.dart';
import 'package:gridwalker/features/tracking/tracking_service.dart';
import 'package:gridwalker/features/sync/github_sync_service.dart';

class MockSecureStorage extends Fake implements FlutterSecureStorage {
  @override
  Future<String?> read({required String key, IOSOptions? iOptions, AndroidOptions? aOptions, LinuxOptions? lOptions, WebOptions? webOptions, MacOSOptions? mOptions, WindowsOptions? wOptions}) async => null;
  @override
  Future<void> write({required String key, required String? value, IOSOptions? iOptions, AndroidOptions? aOptions, LinuxOptions? lOptions, WebOptions? webOptions, MacOSOptions? mOptions, WindowsOptions? wOptions}) async {}
  @override
  Future<void> delete({required String key, IOSOptions? iOptions, AndroidOptions? aOptions, LinuxOptions? lOptions, WebOptions? webOptions, MacOSOptions? mOptions, WindowsOptions? wOptions}) async {}
}

void main() {
  testWidgets('App starts up correctly', (WidgetTester tester) async {
    // 1. Create stubs for services
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final settingsRepository = SettingsRepository(prefs, MockSecureStorage());
    final isarRepository = IsarRepository();
    final trackingService = TrackingService(isarRepository);
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
