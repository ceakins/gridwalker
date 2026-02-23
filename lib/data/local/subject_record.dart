import 'package:isar/isar.dart';

part 'subject_record.g.dart';

@collection
class SubjectRecord {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  late String state;

  @Index(type: IndexType.value)
  late String county;

  @Index()
  late String caseId;

  late String name;
  
  late String geoJson; // GeoJSON Point for the marker location

  late DateTime lastUpdated;

  @Index()
  late bool isActive;

  /// Type of marker: 'subject', 'clue', 'poi'
  @Index()
  late String markerType;
}
