import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../local/subject_record.dart';
import '../local/gps_track.dart';
import '../local/grid_cell.dart';

/// A repository class that manages local persistence using the Isar database.
/// 
/// It handles schemas for grid cells, search records, and GPS tracks,
/// providing high-performance spatial and attribute-based queries.
class IsarRepository {
  late Isar _isar;

  /// Returns the underlying Isar database instance.
  Isar get isar => _isar;

  /// Initializes the Isar database and opens the required collections.
  /// 
  /// Checks for an existing instance before attempting to open a new one.
  Future<void> init() async {
    if (Isar.getInstance() != null) {
      _isar = Isar.getInstance()!;
      return;
    }

    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [SubjectRecordSchema, GpsTrackSchema, GridCellSchema],
      directory: dir.path,
    );
  }

  // --- Grid Cells ---

  /// Retrieves all [GridCell] objects stored in the local database.
  Future<List<GridCell>> getAllGridCells() async {
    return _isar.gridCells.where().findAll();
  }

  /// Finds a specific grid cell based on its [x] and [y] coordinates.
  Future<GridCell?> findCell(int x, int y) async {
    return _isar.gridCells.filter().xEqualTo(x).yEqualTo(y).findFirst();
  }

  /// Updates or inserts a [GridCell] into the database.
  Future<void> updateGridCell(GridCell cell) async {
    await _isar.writeTxn(() => _isar.gridCells.put(cell));
  }

  // --- Markers ---

  /// Retrieves all [SubjectRecord] objects (markers) from the database.
  Future<List<SubjectRecord>> getAllMarkers() async {
    return _isar.subjectRecords.where().anyId().findAll();
  }

  /// Retrieves a specific [SubjectRecord] by its Isar [id].
  Future<SubjectRecord?> getSubjectById(Id id) async {
    return _isar.subjectRecords.get(id);
  }

  // --- Subject Records ---

  /// Retrieves subject records filtered by [state] and [county].
  Future<List<SubjectRecord>> getSubjectsByCounty(String state, String county) {
    return _isar.subjectRecords
        .filter()
        .stateEqualTo(state)
        .countyEqualTo(county)
        .findAll();
  }

  /// Saves a new [SubjectRecord] (clue, subject, or POI) to the database.
  Future<void> saveSubject(SubjectRecord subject) async {
    await _isar.writeTxn(() => _isar.subjectRecords.put(subject));
  }

  // --- GPS Tracks ---

  /// Persists a historical [GpsTrack] to the database.
  Future<void> saveTrack(GpsTrack track) async {
    await _isar.writeTxn(() => _isar.gpsTracks.put(track));
  }

  /// Retrieves historical GPS tracks filtered by [state] and [county].
  Future<List<GpsTrack>> getTracksByJurisdiction(String state, String county) {
    return _isar.gpsTracks
        .filter()
        .stateEqualTo(state)
        .countyEqualTo(county)
        .findAll();
  }

  /// Clears all data from all collections.
  /// 
  /// Used for resetting the application state or starting a new case.
  Future<void> clearAllData() async {
    await _isar.writeTxn(() => _isar.clear());
  }
}
