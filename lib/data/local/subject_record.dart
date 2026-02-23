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
  
  late String geoJson; // GeoJSON Feature representing the subject's last known location or area

  late DateTime lastUpdated;

  @Index()
  late bool isActive;
}
