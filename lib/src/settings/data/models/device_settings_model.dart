import '../../domain/entities/device_settings.dart';

class DeviceSettingsModel extends DeviceSettings {
  const DeviceSettingsModel({
    required super.language,
    required super.themeMode,
  });
  factory DeviceSettingsModel.fromJson(Map<String, dynamic> json) {
    return DeviceSettingsModel(
      language: json['language'] as String,
      themeMode: json['themeMode'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {'language': language, 'themeMode': themeMode};
  }
}
