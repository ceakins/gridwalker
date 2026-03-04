import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SettingsRepository {
  static const String _keyIsSatellite = 'is_satellite';
  static const String _keyIs3D = 'is_3d';
  static const String _keyHasSeenPermissionScreen = 'has_seen_permission_screen';
  static const String _keyCasePassphrase = 'case_passphrase'; // Current case key
  static const String _keyMasterPassphrase = 'master_passphrase';

  final SharedPreferences _prefs;
  final FlutterSecureStorage _secureStorage;
  
  String? _cachedPassphrase;
  String? _cachedMasterPassphrase;

  SettingsRepository(this._prefs, this._secureStorage);

  /// Loads asynchronously stored values. Should be called at app startup.
  Future<void> load() async {
    _cachedPassphrase = await _secureStorage.read(key: _keyCasePassphrase);
    _cachedMasterPassphrase = await _secureStorage.read(key: _keyMasterPassphrase);
  }

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

  String? get casePassphrase => _cachedPassphrase;

  Future<void> setCasePassphrase(String? value) async {
    _cachedPassphrase = value;
    if (value == null) {
      await _secureStorage.delete(key: _keyCasePassphrase);
    } else {
      await _secureStorage.write(key: _keyCasePassphrase, value: value);
    }
  }

  String? get masterPassphrase => _cachedMasterPassphrase;

  Future<void> setMasterPassphrase(String value) async {
    _cachedMasterPassphrase = value;
    await _secureStorage.write(key: _keyMasterPassphrase, value: value);
  }
}
