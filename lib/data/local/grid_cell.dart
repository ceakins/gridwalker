import 'package:isar/isar.dart';

part 'grid_cell.g.dart';

@collection
class GridCell {
  Id id = Isar.autoIncrement;

  @Index()
  int x = 0;

  @Index()
  int y = 0;

  @Index()
  String caseId = "unknown";

  @Index()
  String? county;

  @Index()
  String? state;

  /// Probability of Detection (POD) or coverage percentage (0.0 to 1.0)
  double coverage = 0.0;

  DateTime? lastCleared;

  /// GeoJSON representation of the cell polygon
  String? geoJson;
}
