import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// A repository for managing user preferences and secure forensic keys.
/// 
/// It uses [SharedPreferences] for general settings like map style and 
/// [FlutterSecureStorage] for sensitive data like passphrases.
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

  /// Loads asynchronously stored values from secure and shared storage.
  /// 
  /// Should be called at application startup.
  Future<void> load() async {
    _cachedPassphrase = await _secureStorage.read(key: _keyCasePassphrase);
    _cachedMasterPassphrase = await _secureStorage.read(key: _keyMasterPassphrase);
  }

  /// Whether the map should display satellite imagery.
  bool get isSatellite => _prefs.getBool(_keyIsSatellite) ?? false;
  
  /// Updates and persists the satellite imagery preference.
  Future<void> setSatellite(bool value) async {
    await _prefs.setBool(_keyIsSatellite, value);
  }

  /// Whether the map should be displayed in 3D tilt mode.
  bool get is3D => _prefs.getBool(_keyIs3D) ?? false;

  /// Updates and persists the 3D mode preference.
  Future<void> set3D(bool value) async {
    await _prefs.setBool(_keyIs3D, value);
  }

  /// Whether the user has seen the permission onboarding screen.
  bool get hasSeenPermissionScreen => _prefs.getBool(_keyHasSeenPermissionScreen) ?? false;

  /// Updates and persists the permission onboarding status.
  Future<void> setHasSeenPermissionScreen(bool value) async {
    await _prefs.setBool(_keyHasSeenPermissionScreen, value);
  }

  /// The derived forensic key for the current active search case.
  String? get casePassphrase => _cachedPassphrase;

  /// Persists the case-specific forensic key to secure storage.
  Future<void> setCasePassphrase(String? value) async {
    _cachedPassphrase = value;
    if (value == null) {
      await _secureStorage.delete(key: _keyCasePassphrase);
    } else {
      await _secureStorage.write(key: _keyCasePassphrase, value: value);
    }
  }

  /// The master forensic passphrase stored in secure storage.
  String? get masterPassphrase => _cachedMasterPassphrase;

  /// Persists the master forensic passphrase to secure storage.
  Future<void> setMasterPassphrase(String value) async {
    _cachedMasterPassphrase = value;
    await _secureStorage.write(key: _keyMasterPassphrase, value: value);
  }
}
