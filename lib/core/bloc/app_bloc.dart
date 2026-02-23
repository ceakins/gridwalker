import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:file_picker/file_picker.dart';
import '../../data/local/grid_cell.dart';
import '../../data/local/subject_record.dart';
import '../../data/repositories/isar_repository.dart';
import '../../data/repositories/settings_repository.dart';
import '../../features/tracking/tracking_service.dart';
import '../../features/sync/github_sync_service.dart';
import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final IsarRepository isarRepository;
  final SettingsRepository settingsRepository;
  final TrackingService trackingService;
  final GitHubSyncService syncService;

  StreamSubscription? _posSub;
  StreamSubscription? _gridSub;

  AppBloc({
    required this.isarRepository,
    required this.settingsRepository,
    required this.trackingService,
    required this.syncService,
  }) : super(AppState(
          isSatellite: settingsRepository.isSatellite,
          is3D: settingsRepository.is3D,
        )) {
    on<AppStarted>(_onAppStarted);
    on<StartTracking>(_onStartTracking);
    on<StopTracking>(_onStopTracking);
    on<ClearGrid>(_onClearGrid);
    on<ToggleSatellite>(_onToggleSatellite);
    on<Toggle3D>(_onToggle3D);
    on<ExportGrid>(_onExportGrid);
    on<ImportGrid>(_onImportGrid);
    on<AddMarker>(_onAddMarker);
    on<CreateSearchZone>(_onCreateSearchZone);
    on<PositionUpdated>(_onPositionUpdated);
    on<GridUpdated>(_onGridUpdated);
    on<SyncRequested>(_onSyncRequested);

    _posSub = trackingService.positionStream.listen((p) => add(PositionUpdated(p)));
    _gridSub = trackingService.gridStream.listen((g) => add(GridUpdated(g)));
  }

  Future<void> _onAddMarker(AddMarker event, Emitter<AppState> emit) async {
    final marker = SubjectRecord()
      ..name = event.name
      ..markerType = event.type
      ..state = "AZ"
      ..county = "Yavapai"
      ..caseId = "current"
      ..isActive = true
      ..lastUpdated = DateTime.now()
      ..geoJson = '{"type": "Point", "coordinates": [${event.lng}, ${event.lat}]}';

    await isarRepository.saveSubject(marker);
    final allMarkers = await isarRepository.getAllMarkers();
    emit(state.copyWith(markers: allMarkers));
  }

  Future<void> _onExportGrid(ExportGrid event, Emitter<AppState> emit) async {
    try {
      final cells = await isarRepository.getAllGridCells();
      final markers = await isarRepository.getAllMarkers();

      final Map<String, dynamic> exportData = {
        'version': 1,
        'exportDate': DateTime.now().toIso8601String(),
        'grid': cells.map((c) => {
          'x': c.x,
          'y': c.y,
          'state': c.state,
          'county': c.county,
          'coverage': c.coverage,
          'geoJson': c.geoJson,
        }).toList(),
        'markers': markers.map((m) => {
          'name': m.name,
          'markerType': m.markerType,
          'state': m.state,
          'county': m.county,
          'caseId': m.caseId,
          'geoJson': m.geoJson,
        }).toList(),
      };

      final jsonStr = jsonEncode(exportData);
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/gridwalker_sar_data.json');
      await file.writeAsString(jsonStr);

      await Share.shareXFiles([XFile(file.path)], text: 'GridWalker SAR Search Data');
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Export failed: $e'));
    }
  }

  Future<void> _onImportGrid(ImportGrid event, Emitter<AppState> emit) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['json'],
      );

      if (result != null && result.files.single.path != null) {
        final file = File(result.files.single.path!);
        final jsonStr = await file.readAsString();
        final Map<String, dynamic> data = jsonDecode(jsonStr);

        // Import Grid Cells
        if (data.containsKey('grid')) {
          for (var item in data['grid']) {
            final cell = GridCell()
              ..x = item['x']
              ..y = item['y']
              ..state = item['state']
              ..county = item['county']
              ..coverage = item['coverage']
              ..lastCleared = DateTime.now()
              ..geoJson = item['geoJson'];
            await isarRepository.updateGridCell(cell);
          }
        }

        // Import Markers
        if (data.containsKey('markers')) {
          for (var item in data['markers']) {
            final marker = SubjectRecord()
              ..name = item['name']
              ..markerType = item['markerType']
              ..state = item['state']
              ..county = item['county']
              ..caseId = item['caseId']
              ..isActive = true
              ..lastUpdated = DateTime.now()
              ..geoJson = item['geoJson'];
            await isarRepository.saveSubject(marker);
          }
        }

        final allCells = await isarRepository.getAllGridCells();
        final allMarkers = await isarRepository.getAllMarkers();
        emit(state.copyWith(gridCells: allCells, markers: allMarkers));
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Import failed: $e'));
    }
  }

  Future<void> _onToggleSatellite(ToggleSatellite event, Emitter<AppState> emit) async {
    final newValue = !state.isSatellite;
    await settingsRepository.setSatellite(newValue);
    emit(state.copyWith(isSatellite: newValue));
  }

  Future<void> _onToggle3D(Toggle3D event, Emitter<AppState> emit) async {
    final newValue = !state.is3D;
    await settingsRepository.set3D(newValue);
    emit(state.copyWith(is3D: newValue));
  }

  Future<void> _onClearGrid(ClearGrid event, Emitter<AppState> emit) async {
    await isarRepository.clearAllData();
    emit(state.copyWith(gridCells: [], markers: []));
  }

  Future<void> _onCreateSearchZone(CreateSearchZone event, Emitter<AppState> emit) async {
    const double gridSize = 0.0001; 
    final int startX = (event.minLng / gridSize).floor();
    final int endX = (event.maxLng / gridSize).floor();
    final int startY = (event.minLat / gridSize).floor();
    final int endY = (event.maxLat / gridSize).floor();

    for (int x = startX; x <= endX; x++) {
      for (int y = startY; y <= endY; y++) {
        final existing = await isarRepository.findCell(x, y);
        if (existing != null) continue;

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
    final allCells = await isarRepository.getAllGridCells();
    final allMarkers = await isarRepository.getAllMarkers();
    emit(state.copyWith(status: AppStatus.ready, gridCells: allCells, markers: allMarkers));
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
