import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository {
  static const String _keyIsSatellite = 'is_satellite';
  static const String _keyIs3D = 'is_3d';
  static const String _keyHasSeenPermissionScreen = 'has_seen_permission_screen';

  final SharedPreferences _prefs;

  SettingsRepository(this._prefs);

  bool get isSatellite => _prefs.getBool(_keyIsSatellite) ?? false;
  
  Future<void> setSatellite(bool value) async {
    await _prefs.setBool(_keyIsSatellite, value);
  }

  bool get is3D => _prefs.getBool(_keyIs3D) ?? false;

  Future<void> set3D(bool value) async {
    await _prefs.setBool(_keyIs3D, value);
  }

  bool get hasSeenPermissionScreen => _prefs.getBool(_keyHasSeenPermissionScreen) ?? false;

  Future<void> setHasSeenPermissionScreen(bool value) async {
    await _prefs.setBool(_keyHasSeenPermissionScreen, value);
  }
}
