import 'package:isar_community/isar.dart';

part 'gps_track.g.dart';

@collection
class GpsTrack {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  late String state;

  @Index(type: IndexType.value)
  late String county;

  @Index()
  late String userId;

  late String geoJson; // GeoJSON LineString representing the GPS track

  late DateTime startTime;
  
  late DateTime endTime;

  // Spatial bounding box for fast intersection queries
  late double minLat;
  late double maxLat;
  late double minLng;
  late double maxLng;
}
