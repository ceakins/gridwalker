import 'dart:async';
import 'dart:math';
import 'package:geolocator/geolocator.dart';
import '../../data/repositories/isar_repository.dart';
import '../../data/local/grid_cell.dart';
import 'package:isar/isar.dart';

class TrackingService {
  final IsarRepository _isarRepository;
  StreamSubscription<Position>? _positionSubscription;
  bool _isTracking = false;
  Position? _lastPosition;

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
      locationSettings: AndroidSettings(
        accuracy: LocationAccuracy.bestForNavigation,
        distanceFilter: 0, 
        intervalDuration: const Duration(milliseconds: 500), 
        foregroundNotificationConfig: const ForegroundNotificationConfig(
          notificationText: "GridWalker is tracking your search path",
          notificationTitle: "SAR Tracking Active",
          enableWakeLock: true,
        ),
      ),
    ).listen((Position position) {
      _positionController.add(position);
      _processPosition(position, state, county);
    });
  }

  void _processPosition(Position position, String state, String county) async {
    const double gridSize = 0.0001; // ~11m
    
    final int currentX = (position.longitude / gridSize).floor();
    final int currentY = (position.latitude / gridSize).floor();

    if (_lastPosition != null) {
      final int lastX = (_lastPosition!.longitude / gridSize).floor();
      final int lastY = (_lastPosition!.latitude / gridSize).floor();

      // Interpolate all cells between last and current position (Bresenham's Line Algorithm)
      await _interpolatePath(lastX, lastY, currentX, currentY);
    } else {
      await _clearCell(currentX, currentY);
    }

    _lastPosition = position;
    
    // Refresh the grid state for the UI
    final cells = await _isarRepository.getAllGridCells();
    _gridController.add(cells);
  }

  Future<void> _interpolatePath(int x0, int y0, int x1, int y1) async {
    int dx = (x1 - x0).abs();
    int dy = (y1 - y0).abs();
    int sx = x0 < x1 ? 1 : -1;
    int sy = y0 < y1 ? 1 : -1;
    int err = dx - dy;

    while (true) {
      await _clearCell(x0, y0);
      if (x0 == x1 && y0 == y1) break;
      int e2 = 2 * err;
      if (e2 > -dy) {
        err -= dy;
        x0 += sx;
      }
      if (e2 < dx) {
        err += dx;
        y0 += sy;
      }
    }
  }

  Future<void> _clearCell(int x, int y) async {
    final existingCell = await _isarRepository.findCell(x, y);
    if (existingCell != null && existingCell.coverage < 1.0) {
      existingCell.coverage = 1.0;
      existingCell.lastCleared = DateTime.now();
      await _isarRepository.updateGridCell(existingCell);
    }
  }

  void stopTracking() {
    _positionSubscription?.cancel();
    _isTracking = false;
    _lastPosition = null;
  }

  void dispose() {
    _positionController.close();
    _gridController.close();
  }

  bool get isTracking => _isTracking;
}
