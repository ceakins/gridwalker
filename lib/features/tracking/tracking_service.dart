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
        distanceFilter: 5, 
      ),
    ).listen((Position position) {
      _positionController.add(position);
      _processPosition(position, state, county);
    });
  }

  void _processPosition(Position position, String state, String county) async {
    const double gridSize = 0.00001; 
    final int x = (position.longitude / gridSize).floor();
    final int y = (position.latitude / gridSize).floor();

    // Use our new IsarRepository method instead of direct isar access
    final existingCell = await _isarRepository.findCell(x, y);

    if (existingCell != null && existingCell.coverage < 1.0) {
      existingCell.coverage = 1.0;
      existingCell.lastCleared = DateTime.now();
      await _isarRepository.updateGridCell(existingCell);
      
      // Refresh the grid state
      final cells = await _isarRepository.getAllGridCells();
      _gridController.add(cells);
    }
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
