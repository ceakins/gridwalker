import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import '../../data/local/grid_cell.dart';

enum AppStatus { initial, loading, authenticated, ready, tracking, syncing, error }

class AppState extends Equatable {
  final AppStatus status;
  final String? errorMessage;
  final bool isTracking;
  final bool isSyncing;
  final bool isSatellite;
  final bool is3D;
  final Position? currentPosition;
  final List<GridCell> gridCells;

  const AppState({
    this.status = AppStatus.initial,
    this.errorMessage,
    this.isTracking = false,
    this.isSyncing = false,
    this.isSatellite = false,
    this.is3D = false,
    this.currentPosition,
    this.gridCells = const [],
  });

  AppState copyWith({
    AppStatus? status,
    String? errorMessage,
    bool? isTracking,
    bool? isSyncing,
    bool? isSatellite,
    bool? is3D,
    Position? currentPosition,
    List<GridCell>? gridCells,
  }) {
    return AppState(
      status: status ?? this.status,
      errorMessage: errorMessage,
      isTracking: isTracking ?? this.isTracking,
      isSyncing: isSyncing ?? this.isSyncing,
      isSatellite: isSatellite ?? this.isSatellite,
      is3D: is3D ?? this.is3D,
      currentPosition: currentPosition ?? this.currentPosition,
      gridCells: gridCells ?? this.gridCells,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, isTracking, isSyncing, isSatellite, is3D, currentPosition, gridCells];
}
