import 'package:isar_community/isar.dart';

part 'gps_track.g.dart';

/// Represents a historical GPS track recorded during a search mission.
/// 
/// Stores the complete path as a GeoJSON LineString along with metadata
/// like time range and spatial bounds for fast lookup.
@collection
class GpsTrack {
  /// Internal Isar ID.
  Id id = Isar.autoIncrement;

  /// State where the track was recorded.
  @Index(type: IndexType.value)
  late String state;

  /// County where the track was recorded.
  @Index(type: IndexType.value)
  late String county;

  /// Unique identifier for the user who recorded this track.
  @Index()
  late String userId;

  /// GeoJSON LineString representing the complete GPS path.
  late String geoJson;

  /// When the tracking session started.
  late DateTime startTime;
  
  /// When the tracking session ended.
  late DateTime endTime;

  /// Minimum latitude in the track (for bounding box).
  late double minLat;
  /// Maximum latitude in the track (for bounding box).
  late double maxLat;
  /// Minimum longitude in the track (for bounding box).
  late double minLng;
  /// Maximum longitude in the track (for bounding box).
  late double maxLng;
}
