import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import '../../data/local/grid_cell.dart';
import '../../data/local/subject_record.dart';

enum AppStatus { initial, loading, authenticated, ready, tracking, syncing, error }

class AppState extends Equatable {
  final AppStatus status;
  final String? errorMessage;
  final bool isTracking;
  final bool isSyncing;
  final bool isSatellite;
  final bool is3D;
  final bool hasSeenPermissionScreen;
  final bool isMasterPassphraseSet;
  final String? currentCaseId;
  final Position? currentPosition;
  final List<GridCell> gridCells;
  final List<SubjectRecord> markers;

  const AppState({
    this.status = AppStatus.initial,
    this.errorMessage,
    this.isTracking = false,
    this.isSyncing = false,
    this.isSatellite = false,
    this.is3D = false,
    this.hasSeenPermissionScreen = false,
    this.isMasterPassphraseSet = false,
    this.currentCaseId,
    this.currentPosition,
    this.gridCells = const [],
    this.markers = const [],
  });

  AppState copyWith({
    AppStatus? status,
    String? errorMessage,
    bool? isTracking,
    bool? isSyncing,
    bool? isSatellite,
    bool? is3D,
    bool? hasSeenPermissionScreen,
    bool? isMasterPassphraseSet,
    String? currentCaseId,
    Position? currentPosition,
    List<GridCell>? gridCells,
    List<SubjectRecord>? markers,
  }) {
    return AppState(
      status: status ?? this.status,
      errorMessage: errorMessage,
      isTracking: isTracking ?? this.isTracking,
      isSyncing: isSyncing ?? this.isSyncing,
      isSatellite: isSatellite ?? this.isSatellite,
      is3D: is3D ?? this.is3D,
      hasSeenPermissionScreen: hasSeenPermissionScreen ?? this.hasSeenPermissionScreen,
      isMasterPassphraseSet: isMasterPassphraseSet ?? this.isMasterPassphraseSet,
      currentCaseId: currentCaseId ?? this.currentCaseId,
      currentPosition: currentPosition ?? this.currentPosition,
      gridCells: gridCells ?? this.gridCells,
      markers: markers ?? this.markers,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, isTracking, isSyncing, isSatellite, is3D, hasSeenPermissionScreen, isMasterPassphraseSet, currentCaseId, currentPosition, gridCells, markers];
}
