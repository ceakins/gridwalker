import 'dart:async';
import 'package:geolocator/geolocator.dart';
import '../../data/repositories/isar_repository.dart';
import '../../data/local/grid_cell.dart';

class TrackingService {
  final IsarRepository _isarRepository;
  StreamSubscription<Position>? _positionSubscription;
  bool _isTracking = false;

  TrackingService(this._isarRepository);

  /// Start background GPS tracking and update grid cell POD (Probability of Detection)
  Future<void> startTracking({
    required String state,
    required String county,
  }) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return Future.error('Location services are disabled.');

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    }

    _isTracking = true;
    _positionSubscription = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10, // Update every 10 meters
      ),
    ).listen((Position position) {
      _processPosition(position, state, county);
    });
  }

  void _processPosition(Position position, String state, String county) async {
    // 1. Calculate the grid cell coordinates (x, y) based on a simple lat/lng to grid logic
    // (A more complex projection or H3 indexing would be used for production)
    final int x = (position.longitude * 100).floor();
    final int y = (position.latitude * 100).floor();

    // 2. Fetch or update the cell in Isar
    // For now, let's create a placeholder cell if not exists
    final cell = GridCell()
      ..x = x
      ..y = y
      ..state = state
      ..county = county
      ..coverage = 1.0 // Fully cleared cell
      ..lastCleared = DateTime.now()
      ..geoJson = '{"type": "Polygon", "coordinates": []}'; // Placeholder

    await _isarRepository.updateGridCell(cell);
  }

  void stopTracking() {
    _positionSubscription?.cancel();
    _isTracking = false;
  }

  bool get isTracking => _isTracking;
}
