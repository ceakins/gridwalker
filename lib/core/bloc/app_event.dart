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

class MarkPermissionScreenSeen extends AppEvent {}

class SetMasterPassphrase extends AppEvent {
  final String passphrase;
  const SetMasterPassphrase(this.passphrase);
  @override
  List<Object?> get props => [passphrase];
}

class ToggleSatellite extends AppEvent {}

class Toggle3D extends AppEvent {}

class ExportGrid extends AppEvent {}

class ImportGrid extends AppEvent {
  final String? passphrase;
  const ImportGrid({this.passphrase});
  @override
  List<Object?> get props => [passphrase];
}

class AddMarker extends AppEvent {
  final String name;
  final String type;
  final double lat;
  final double lng;
  final String? photoPath;
  final String? photoBase64;
  final bool isPhotoEncrypted;

  const AddMarker({
    required this.name,
    required this.type,
    required this.lat,
    required this.lng,
    this.photoPath,
    this.photoBase64,
    this.isPhotoEncrypted = false,
  });

  @override
  List<Object?> get props => [name, type, lat, lng, photoPath, photoBase64, isPhotoEncrypted];
}

class CreateSearchZone extends AppEvent {
  final double minLat;
  final double maxLat;
  final double minLng;
  final double maxLng;
  final String caseId;

  const CreateSearchZone({
    required this.minLat,
    required this.maxLat,
    required this.minLng,
    required this.maxLng,
    required this.caseId,
  });

  @override
  List<Object?> get props => [minLat, maxLat, minLng, maxLng, caseId];
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
