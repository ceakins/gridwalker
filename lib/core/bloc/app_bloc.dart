import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/local/grid_cell.dart';
import '../../data/repositories/isar_repository.dart';
import '../../features/tracking/tracking_service.dart';
import '../../features/sync/github_sync_service.dart';
import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final IsarRepository isarRepository;
  final TrackingService trackingService;
  final GitHubSyncService syncService;

  StreamSubscription? _posSub;
  StreamSubscription? _gridSub;

  AppBloc({
    required this.isarRepository,
    required this.trackingService,
    required this.syncService,
  }) : super(const AppState()) {
    on<AppStarted>(_onAppStarted);
    on<StartTracking>(_onStartTracking);
    on<StopTracking>(_onStopTracking);
    on<ClearGrid>(_onClearGrid);
    on<CreateSearchZone>(_onCreateSearchZone);
    on<PositionUpdated>(_onPositionUpdated);
    on<GridUpdated>(_onGridUpdated);
    on<SyncRequested>(_onSyncRequested);

    _posSub = trackingService.positionStream.listen((p) => add(PositionUpdated(p)));
    _gridSub = trackingService.gridStream.listen((g) => add(GridUpdated(g)));
  }

  Future<void> _onClearGrid(ClearGrid event, Emitter<AppState> emit) async {
    await isarRepository.clearAllData();
    emit(state.copyWith(gridCells: []));
  }

  Future<void> _onCreateSearchZone(CreateSearchZone event, Emitter<AppState> emit) async {
    const double gridSize = 0.0001; // ~11m (The 10m SAR Standard)
    
    final int startX = (event.minLng / gridSize).floor();
    final int endX = (event.maxLng / gridSize).floor();
    final int startY = (event.minLat / gridSize).floor();
    final int endY = (event.maxLat / gridSize).floor();

    for (int x = startX; x <= endX; x++) {
      for (int y = startY; y <= endY; y++) {
        // MERGE LOGIC: Check if this cell already exists
        final existing = await isarRepository.findCell(x, y);
        if (existing != null) continue; // Skip duplicates

        final double minX = x * gridSize;
        final double minY = y * gridSize;
        final double maxX = (x + 1) * gridSize;
        final double maxY = (y + 1) * gridSize;

        final cell = GridCell()
          ..x = x
          ..y = y
          ..state = "AZ"
          ..county = "Yavapai"
          ..coverage = 0.0 
          ..lastCleared = DateTime.now()
          ..geoJson = '{"type": "Polygon", "coordinates": [[['
              '${minX.toStringAsFixed(6)}, ${minY.toStringAsFixed(6)}], ['
              '${maxX.toStringAsFixed(6)}, ${minY.toStringAsFixed(6)}], ['
              '${maxX.toStringAsFixed(6)}, ${maxY.toStringAsFixed(6)}], ['
              '${minX.toStringAsFixed(6)}, ${maxY.toStringAsFixed(6)}], ['
              '${minX.toStringAsFixed(6)}, ${minY.toStringAsFixed(6)}]]]}';

        await isarRepository.updateGridCell(cell);
      }
    }
    
    final allCells = await isarRepository.getAllGridCells();
    emit(state.copyWith(gridCells: allCells));
  }

  Future<void> _onAppStarted(AppStarted event, Emitter<AppState> emit) async {
    emit(state.copyWith(status: AppStatus.ready));
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

  void _onPositionUpdated(PositionUpdated event, Emitter<AppState> emit) {
    emit(state.copyWith(currentPosition: event.position));
  }

  void _onGridUpdated(GridUpdated event, Emitter<AppState> emit) {
    emit(state.copyWith(gridCells: event.cells));
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
      emit(state.copyWith(isSyncing: false));
    } catch (e) {
      emit(state.copyWith(isSyncing: false, errorMessage: 'Sync failed: $e'));
    }
  }

  @override
  Future<void> close() {
    _posSub?.cancel();
    _gridSub?.cancel();
    return super.close();
  }
}
