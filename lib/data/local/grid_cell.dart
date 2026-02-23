import 'package:isar/isar.dart';

part 'grid_cell.g.dart';

@collection
class GridCell {
  Id id = Isar.autoIncrement;

  @Index()
  late int x;

  @Index()
  late int y;

  @Index()
  late String county;

  @Index()
  late String state;

  /// Probability of Detection (POD) or coverage percentage (0.0 to 1.0)
  late double coverage;

  late DateTime lastCleared;

  /// GeoJSON representation of the cell polygon
  late String geoJson;
}
