import 'package:flutter_test/flutter_test.dart';
import 'package:github/github.dart';
import 'package:gridwalker/main.dart';
import 'package:gridwalker/data/repositories/isar_repository.dart';
import 'package:gridwalker/features/tracking/tracking_service.dart';
import 'package:gridwalker/features/sync/github_sync_service.dart';

void main() {
  testWidgets('App starts up correctly', (WidgetTester tester) async {
    // 1. Create stubs for services
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
      trackingService: trackingService,
      syncService: syncService,
    ));

    // 3. Verify that the app title is present
    expect(find.text('GridWalker SR'), findsOneWidget);
  });
}
