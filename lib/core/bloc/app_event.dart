import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import '../../data/local/grid_cell.dart';

/// Base class for all application-wide events in the [AppBloc].
abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

/// Triggered when the application first starts.
class AppStarted extends AppEvent {}

/// Starts the GPS tracking service for a specific [state] and [county].
class StartTracking extends AppEvent {
  final String state;
  final String county;

  const StartTracking({required this.state, required this.county});

  @override
  List<Object?> get props => [state, county];
}

/// Stops the active GPS tracking session.
class StopTracking extends AppEvent {}

/// Clears all local search data and resets the application state.
class ClearGrid extends AppEvent {}

/// Marks that the user has seen and responded to the initial permission onboarding.
class MarkPermissionScreenSeen extends AppEvent {}

/// Sets the master forensic passphrase used to derive case-specific keys.
class SetMasterPassphrase extends AppEvent {
  final String passphrase;
  const SetMasterPassphrase(this.passphrase);
  @override
  List<Object?> get props => [passphrase];
}

/// Toggles between satellite and vector map styles.
class ToggleSatellite extends AppEvent {}

/// Toggles the 3D terrain/tilt view on the map.
class Toggle3D extends AppEvent {}

/// Exports the current grid and markers to a JSON file for sharing.
class ExportGrid extends AppEvent {}

/// Imports grid and marker data from a JSON file.
class ImportGrid extends AppEvent {
  final String? passphrase;
  const ImportGrid({this.passphrase});
  @override
  List<Object?> get props => [passphrase];
}

/// Adds a new search marker (clue, subject, or POI) to the map.
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

/// Creates a new search grid zone within the specified lat/lng bounds.
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

/// Updates the app state with a new GPS [position].
class PositionUpdated extends AppEvent {
  final Position position;
  const PositionUpdated(this.position);

  @override
  List<Object?> get props => [position];
}

/// Updates the app state with a new list of [cells] from the tracking service.
class GridUpdated extends AppEvent {
  final List<GridCell> cells;
  const GridUpdated(this.cells);

  @override
  List<Object?> get props => [cells];
}

/// Requests a data synchronization with the remote GitHub repository.
class SyncRequested extends AppEvent {
  final String country;
  final String state;
  final String county;
  final String caseId;

  const SyncRequested({required this.country, required this.state, required this.county, required this.caseId});

  @override
  List<Object?> get props => [country, state, county, caseId];
}
