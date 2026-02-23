import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github/github.dart';
import 'core/bloc/app_bloc.dart';
import 'core/bloc/app_event.dart';
import 'data/repositories/isar_repository.dart';
import 'features/tracking/tracking_service.dart';
import 'features/sync/github_sync_service.dart';
import 'features/map/pages/map_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Initialize Core Services
  final isarRepository = IsarRepository();
  await isarRepository.init(); // Initialize Isar before app starts

  final trackingService = TrackingService(isarRepository);
  
  // NOTE: In production, these should be secure storage or user input
  final github = GitHub(auth: Authentication.anonymous()); 
  final syncService = GitHubSyncService(
    github: github, 
    owner: 'gridwalker-org', 
    repo: 'cases',
  );

  runApp(MyApp(
    isarRepository: isarRepository,
    trackingService: trackingService,
    syncService: syncService,
  ));
}

class MyApp extends StatelessWidget {
  final IsarRepository isarRepository;
  final TrackingService trackingService;
  final GitHubSyncService syncService;

  const MyApp({
    super.key,
    required this.isarRepository,
    required this.trackingService,
    required this.syncService,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: isarRepository),
        RepositoryProvider.value(value: trackingService),
        RepositoryProvider.value(value: syncService),
      ],
      child: BlocProvider(
        create: (context) => AppBloc(
          isarRepository: isarRepository,
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
