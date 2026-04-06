import 'package:isar_community/isar.dart';

part 'subject_record.g.dart';

/// Represents a marker or physical record found during a search.
/// 
/// This includes information on clues, subjects, and points of interest.
@collection
class SubjectRecord {
  /// Internal Isar ID.
  Id id = Isar.autoIncrement;

  /// State where the record was created.
  @Index(type: IndexType.value)
  String? state;

  /// County where the record was created.
  @Index(type: IndexType.value)
  String? county;

  /// The specific search case identifier.
  @Index()
  String? caseId;

  /// A descriptive name or title for the record.
  String? name;
  
  /// GeoJSON Point representing the marker's coordinates.
  String? geoJson;

  /// Last modification timestamp.
  DateTime? lastUpdated;

  /// Whether the marker is currently active on the map.
  @Index()
  bool isActive = true;

  /// The type of marker: 'subject', 'clue', or 'poi'.
  @Index()
  String? markerType;

  /// Local filesystem path to a captured photo.
  String? photoPath;

  /// Base64 encoded photo content (encrypted if [isPhotoEncrypted] is true).
  String? photoBase64;

  /// Whether the photo is forensic-encrypted.
  bool isPhotoEncrypted = false;
}
