import '../entities/device_settings.dart';

abstract class DeviceSettingsRepository {
  /// Returns the current device settings.
  Future<DeviceSettings> getDeviceSettings();

  /// Updates the device settings.
  Future<DeviceSettings> updateDeviceSettings({
    required DeviceSettings settings,
  });

  /// Resets the device settings to default values.
  Future<void> resetDeviceSettings();
}
