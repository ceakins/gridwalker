import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import '../../data/local/grid_cell.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

class AppStarted extends AppEvent {}

class StartTracking extends AppEvent {
  final String state;
  final String county;

  const StartTracking({required this.state, required this.county});

  @override
  List<Object?> get props => [state, county];
}

class StopTracking extends AppEvent {}

class ClearGrid extends AppEvent {}

class ToggleSatellite extends AppEvent {}

class Toggle3D extends AppEvent {}

class ExportGrid extends AppEvent {}

class ImportGrid extends AppEvent {}

class CreateSearchZone extends AppEvent {
  final double minLat;
  final double maxLat;
  final double minLng;
  final double maxLng;

  const CreateSearchZone({
    required this.minLat,
    required this.maxLat,
    required this.minLng,
    required this.maxLng,
  });

  @override
  List<Object?> get props => [minLat, maxLat, minLng, maxLng];
}

class PositionUpdated extends AppEvent {
  final Position position;
  const PositionUpdated(this.position);

  @override
  List<Object?> get props => [position];
}

class GridUpdated extends AppEvent {
  final List<GridCell> cells;
  const GridUpdated(this.cells);

  @override
  List<Object?> get props => [cells];
}

class SyncRequested extends AppEvent {
  final String country;
  final String state;
  final String county;
  final String caseId;

  const SyncRequested({required this.country, required this.state, required this.county, required this.caseId});

  @override
  List<Object?> get props => [country, state, county, caseId];
}
