import 'package:isar/isar.dart';

part 'subject_record.g.dart';

@collection
class SubjectRecord {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  String? state;

  @Index(type: IndexType.value)
  String? county;

  @Index()
  String? caseId;

  String? name;
  
  String? geoJson; // GeoJSON Point for the marker location

  DateTime? lastUpdated;

  @Index()
  bool isActive = true;

  /// Type of marker: 'subject', 'clue', 'poi'
  @Index()
  String? markerType;

  String? photoPath; // Local path to the photo file

  String? photoBase64; // Base64 encoded photo (encrypted if isPhotoEncrypted is true)

  bool isPhotoEncrypted = false;
}
