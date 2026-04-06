import 'package:isar_community/isar.dart';

part 'grid_cell.g.dart';

/// Represents a single geographic unit in the search grid.
/// 
/// The grid is based on a fixed coordinate system where each cell
/// represents approximately 11m x 11m (0.0001 degrees).
@collection
class GridCell {
  /// Internal Isar ID.
  Id id = Isar.autoIncrement;

  /// The X coordinate of the cell in the grid (longitude-based).
  @Index()
  int x = 0;

  /// The Y coordinate of the cell in the grid (latitude-based).
  @Index()
  int y = 0;

  /// The unique identifier for the search case this cell belongs to.
  @Index()
  String caseId = "unknown";

  /// The county where this cell is located.
  @Index()
  String? county;

  /// The state where this cell is located.
  @Index()
  String? state;

  /// Probability of Detection (POD) or coverage percentage (0.0 to 1.0).
  /// 
  /// A value of 1.0 indicates the cell has been fully traversed.
  double coverage = 0.0;

  /// The timestamp of when this cell was last marked as cleared.
  DateTime? lastCleared;

  /// GeoJSON representation of the cell polygon for mapping.
  String? geoJson;
}
