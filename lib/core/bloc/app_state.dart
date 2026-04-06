import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import '../../data/local/grid_cell.dart';
import '../../data/local/subject_record.dart';

/// Represents the status of the overall application lifecycle.
enum AppStatus { 
  /// Services are being initialized.
  initial, 
  /// Data is being loaded from local storage.
  loading, 
  /// The user has been authenticated (if applicable).
  authenticated, 
  /// The app is ready for user interaction.
  ready, 
  /// GPS tracking is currently active.
  tracking, 
  /// A synchronization operation is in progress.
  syncing, 
  /// An error has occurred.
  error 
}

/// The global state of the GridWalker application.
/// 
/// Contains information about tracking status, map settings, current search data,
/// and user preferences.
class AppState extends Equatable {
  /// The current lifecycle status of the app.
  final AppStatus status;

  /// Error message to be displayed to the user, if any.
  final String? errorMessage;

  /// Whether GPS tracking is currently active.
  final bool isTracking;

  /// Whether a sync operation is currently in progress.
  final bool isSyncing;

  /// Whether the map is in satellite mode (true) or vector mode (false).
  final bool isSatellite;

  /// Whether the map is in 3D tilt mode.
  final bool is3D;

  /// Whether the user has completed the initial permission onboarding.
  final bool hasSeenPermissionScreen;

  /// Whether the master passphrase for forensic encryption has been set.
  final bool isMasterPassphraseSet;

  /// The unique identifier for the current active search case.
  final String? currentCaseId;

  /// The current GPS position of the user.
  final Position? currentPosition;

  /// The list of all grid cells in the current search area.
  final List<GridCell> gridCells;

  /// The list of all markers (clues, subjects, etc.) in the current case.
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

  /// Creates a copy of the current state with updated fields.
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
  List<Object?> get props => [
    status,
    errorMessage,
    isTracking,
    isSyncing,
    isSatellite,
    is3D,
    hasSeenPermissionScreen,
    isMasterPassphraseSet,
    currentCaseId,
    currentPosition,
    gridCells,
    markers,
  ];
}
