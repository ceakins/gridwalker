import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/isar_repository.dart';
import '../../features/tracking/tracking_service.dart';
import '../../features/sync/github_sync_service.dart';
import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final IsarRepository isarRepository;
  final TrackingService trackingService;
  final GitHubSyncService syncService;

  AppBloc({
    required this.isarRepository,
    required this.trackingService,
    required this.syncService,
  }) : super(const AppState()) {
    on<AppStarted>(_onAppStarted);
    on<StartTracking>(_onStartTracking);
    on<StopTracking>(_onStopTracking);
    on<SyncRequested>(_onSyncRequested);
  }

  Future<void> _onAppStarted(AppStarted event, Emitter<AppState> emit) async {
    emit(state.copyWith(status: AppStatus.loading));
    try {
      await isarRepository.init();
      emit(state.copyWith(status: AppStatus.ready));
    } catch (e) {
      emit(state.copyWith(status: AppStatus.error, errorMessage: e.toString()));
    }
  }

  Future<void> _onStartTracking(StartTracking event, Emitter<AppState> emit) async {
    try {
      await trackingService.startTracking(state: event.state, county: event.county);
      emit(state.copyWith(isTracking: true));
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Failed to start tracking: $e'));
    }
  }

  void _onStopTracking(StopTracking event, Emitter<AppState> emit) {
    trackingService.stopTracking();
    emit(state.copyWith(isTracking: false));
  }

  Future<void> _onSyncRequested(SyncRequested event, Emitter<AppState> emit) async {
    emit(state.copyWith(isSyncing: true));
    try {
      await syncService.fetchSearchRecord(
        country: event.country,
        state: event.state,
        county: event.county,
        caseId: event.caseId,
      );
      // Simulate successful sync
      emit(state.copyWith(isSyncing: false));
    } catch (e) {
      emit(state.copyWith(
        isSyncing: false,
        errorMessage: 'Sync failed: $e',
      ));
    }
  }
}
