import 'dart:async';
import 'package:geolocator/geolocator.dart';
import '../../data/repositories/isar_repository.dart';
import '../../data/local/grid_cell.dart';

class TrackingService {
  final IsarRepository _isarRepository;
  StreamSubscription<Position>? _positionSubscription;
  bool _isTracking = false;

  final _positionController = StreamController<Position>.broadcast();
  final _gridController = StreamController<List<GridCell>>.broadcast();

  Stream<Position> get positionStream => _positionController.stream;
  Stream<List<GridCell>> get gridStream => _gridController.stream;

  TrackingService(this._isarRepository);

  Future<void> startTracking({
    required String state,
    required String county,
  }) async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return Future.error('Location services are disabled.');

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return Future.error('Location permissions denied');
    }

    _isTracking = true;
    _positionSubscription = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 5, // Update every 5 meters
      ),
    ).listen((Position position) {
      _positionController.add(position);
      _processPosition(position, state, county);
    });
  }

  void _processPosition(Position position, String state, String county) async {
    // Lat/Lng to Grid indexing (Approx. 110m cells)
    final int x = (position.longitude * 1000).floor();
    final int y = (position.latitude * 1000).floor();

    final cell = GridCell()
      ..x = x
      ..y = y
      ..state = state
      ..county = county
      ..coverage = 1.0
      ..lastCleared = DateTime.now()
      ..geoJson = '{"type": "Polygon", "coordinates": [[[${x/1000}, ${y/1000}], [${(x+1)/1000}, ${y/1000}], [${(x+1)/1000}, ${(y+1)/1000}], [${x/1000}, ${(y+1)/1000}], [${x/1000}, ${y/1000}]]]}';

    await _isarRepository.updateGridCell(cell);
    
    // Refresh the grid state (In production, query only the bounds)
    final cells = await _isarRepository.getCellsInBounds(0,0,0,0);
    _gridController.add(cells);
  }

  void stopTracking() {
    _positionSubscription?.cancel();
    _isTracking = false;
  }

  void dispose() {
    _positionController.close();
    _gridController.close();
  }

  bool get isTracking => _isTracking;
}
