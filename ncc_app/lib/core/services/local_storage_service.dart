import 'package:encrypt_shared_preferences/provider.dart';

abstract class LocalStorageService {
  Future<List<String>?> getStringList(String key);
  Future<bool> setStringList(String key, List<String> value);
  Future<String?> getString(String key);
  Future<bool> setString(String key, String value);
  Future<bool?> getBool(String key);
  Future<bool> setBool(String key, bool value);
  Future<int?> getInt(String key);
  Future<bool> setInt(String key, int value);
  Future<double?> getDouble(String key);
  Future<bool> setDouble(String key, double value);
  Future<bool> remove(String key);
  Future<bool> clear();
}

class LocalStorageServiceImpl implements LocalStorageService {
  final EncryptedSharedPreferences _sharedPreferences;

  LocalStorageServiceImpl({required this._sharedPreferences});

  @override
  Future<List<String>?> getStringList(String key) async {
    return _sharedPreferences.getStringList(key);
  }

  @override
  Future<bool> setStringList(String key, List<String> value) async {
    return _sharedPreferences.setStringList(key, value);
  }

  @override
  Future<String?> getString(String key) async {
    return _sharedPreferences.getString(key);
  }

  @override
  Future<bool> setString(String key, String value) async {
    return _sharedPreferences.setString(key, value);
  }

  @override
  Future<bool?> getBool(String key) async {
    return _sharedPreferences.getBoolean(key);
  }

  @override
  Future<bool> setBool(String key, bool value) async {
    return _sharedPreferences.setBoolean(key, value);
  }

  @override
  Future<int?> getInt(String key) async {
    return _sharedPreferences.getInt(key);
  }

  @override
  Future<bool> setInt(String key, int value) async {
    return _sharedPreferences.setInt(key, value);
  }

  @override
  Future<double?> getDouble(String key) async {
    return _sharedPreferences.getDouble(key);
  }

  @override
  Future<bool> setDouble(String key, double value) async {
    return _sharedPreferences.setDouble(key, value);
  }

  @override
  Future<bool> remove(String key) async {
    return _sharedPreferences.remove(key);
  }

  @override
  Future<bool> clear() async {
    return _sharedPreferences.clear();
  }
}
