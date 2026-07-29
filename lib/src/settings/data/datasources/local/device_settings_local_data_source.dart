import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/exceptions/exceptions.dart';
import '../../models/device_settings_model.dart';

abstract class DeviceSettingsLocalDataSource {
  /// Returns the current device settings.
  Future<DeviceSettingsModel> getDeviceSettings();

  /// Updates the device settings.
  Future<DeviceSettingsModel> updateDeviceSettings({
    required DeviceSettingsModel settings,
  });

  /// Resets the device settings to default values.
  Future<void> resetDeviceSettings();
}

class DeviceSettingsLocalDataSourceImpl
    implements DeviceSettingsLocalDataSource {
  final SharedPreferences _sharedPreferences;
  final String _deviceSettingsKey = 'device_settings';
  DeviceSettingsLocalDataSourceImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  @override
  Future<DeviceSettingsModel> getDeviceSettings() {
    final String? jsonString = _sharedPreferences.getString(_deviceSettingsKey);
    try {
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString!);
      log('jsonMap: $jsonMap');

      return Future.value(DeviceSettingsModel.fromJson(jsonMap));
    } catch (e) {
      throw UnableToLoadInitialSettingsException();
    }
  }

  @override
  Future<void> resetDeviceSettings() {
    throw UnimplementedError();
  }

  @override
  Future<DeviceSettingsModel> updateDeviceSettings({
    required DeviceSettingsModel settings,
  }) async {
    try {
      final Map<String, dynamic> jsonMap = settings.toJson();
      final String jsonString = jsonEncode(jsonMap);
      await _sharedPreferences.setString(_deviceSettingsKey, jsonString);
      return Future.value(settings);
    } catch (e) {
      throw UnableToLoadInitialSettingsException();
    }
  }
}
