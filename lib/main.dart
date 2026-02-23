import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github/github.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/bloc/app_bloc.dart';
import 'core/bloc/app_event.dart';
import 'data/repositories/isar_repository.dart';
import 'data/repositories/settings_repository.dart';
import 'features/tracking/tracking_service.dart';
import 'features/sync/github_sync_service.dart';
import 'features/map/pages/map_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Initialize Core Services
  final isarRepository = IsarRepository();
  await isarRepository.init();

  final prefs = await SharedPreferences.getInstance();
  final settingsRepository = SettingsRepository(prefs);

  final trackingService = TrackingService(isarRepository);
  
  final github = GitHub(auth: Authentication.anonymous()); 
  final syncService = GitHubSyncService(
    github: github, 
    owner: 'gridwalker-org', 
    repo: 'cases',
  );

  runApp(MyApp(
    isarRepository: isarRepository,
    settingsRepository: settingsRepository,
    trackingService: trackingService,
    syncService: syncService,
  ));
}

class MyApp extends StatelessWidget {
  final IsarRepository isarRepository;
  final SettingsRepository settingsRepository;
  final TrackingService trackingService;
  final GitHubSyncService syncService;

  const MyApp({
    super.key,
    required this.isarRepository,
    required this.settingsRepository,
    required this.trackingService,
    required this.syncService,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: isarRepository),
        RepositoryProvider.value(value: settingsRepository),
        RepositoryProvider.value(value: trackingService),
        RepositoryProvider.value(value: syncService),
      ],
      child: BlocProvider(
        create: (context) => AppBloc(
          isarRepository: isarRepository,
          settingsRepository: settingsRepository,
          trackingService: trackingService,
          syncService: syncService,
        )..add(AppStarted()),
        child: MaterialApp(
          title: 'GridWalker SAR',
          theme: ThemeData(
            primarySwatch: Colors.orange,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(
             brightness: Brightness.dark,
             primarySwatch: Colors.orange,
          ),
          themeMode: ThemeMode.system,
          home: const MapPage(),
        ),
      ),
    );
  }
}
