import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gridwalker/data/repositories/settings_repository.dart';

class MockSecureStorage extends Fake implements FlutterSecureStorage {
  final Map<String, String> storage = {};

  @override
  Future<String?> read({required String key, IOSOptions? iOptions, AndroidOptions? aOptions, LinuxOptions? lOptions, WebOptions? webOptions, MacOSOptions? mOptions, WindowsOptions? wOptions}) async {
    return storage[key];
  }

  @override
  Future<void> write({required String key, required String? value, IOSOptions? iOptions, AndroidOptions? aOptions, LinuxOptions? lOptions, WebOptions? webOptions, MacOSOptions? mOptions, WindowsOptions? wOptions}) async {
    if (value != null) storage[key] = value;
  }

  @override
  Future<void> delete({required String key, IOSOptions? iOptions, AndroidOptions? aOptions, LinuxOptions? lOptions, WebOptions? webOptions, MacOSOptions? mOptions, WindowsOptions? wOptions}) async {
    storage.remove(key);
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SettingsRepository', () {
    late SettingsRepository repository;
    late SharedPreferences prefs;
    late MockSecureStorage secureStorage;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      prefs = await SharedPreferences.getInstance();
      secureStorage = MockSecureStorage();
      repository = SettingsRepository(prefs, secureStorage);
    });

    test('hasSeenPermissionScreen defaults to false', () {
      expect(repository.hasSeenPermissionScreen, isFalse);
    });

    test('casePassphrase uses secure storage', () async {
      await repository.setCasePassphrase('test-key');
      expect(repository.casePassphrase, 'test-key');
      expect(secureStorage.storage['case_passphrase'], 'test-key');
      
      await repository.load();
      expect(repository.casePassphrase, 'test-key');
    });
  });
}
