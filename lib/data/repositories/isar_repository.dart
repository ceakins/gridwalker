import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../local/subject_record.dart';
import '../local/gps_track.dart';
import '../local/grid_cell.dart';

class IsarRepository {
  late Isar _isar;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [SubjectRecordSchema, GpsTrackSchema, GridCellSchema],
      directory: dir.path,
    );
  }

  // --- Subject Records ---
  Future<List<SubjectRecord>> getSubjectsByCounty(String state, String county) {
    return _isar.subjectRecords
        .filter()
        .stateEqualTo(state)
        .countyEqualTo(county)
        .findAll();
  }

  Future<void> saveSubject(SubjectRecord subject) async {
    await _isar.writeTxn(() => _isar.subjectRecords.put(subject));
  }

  // --- GPS Tracks ---
  Future<void> saveTrack(GpsTrack track) async {
    await _isar.writeTxn(() => _isar.gpsTracks.put(track));
  }

  Future<List<GpsTrack>> getTracksByJurisdiction(String state, String county) {
    return _isar.gpsTracks
        .filter()
        .stateEqualTo(state)
        .countyEqualTo(county)
        .findAll();
  }

  // --- Grid Cells ---
  Future<void> updateGridCell(GridCell cell) async {
    await _isar.writeTxn(() => _isar.gridCells.put(cell));
  }

  Future<List<GridCell>> getCellsInBounds(double minLat, double maxLat, double minLng, double maxLng) {
    // Spatial queries can be optimized by using a simpler index filter first
    return _isar.gridCells.where().findAll();
  }

  Future<void> clearAllData() async {
    await _isar.writeTxn(() => _isar.clear());
  }
}
