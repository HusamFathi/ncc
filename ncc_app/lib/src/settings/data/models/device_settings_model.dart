import '../../domain/entities/device_settings.dart';

class DeviceSettingsModel extends DeviceSettings {
  const DeviceSettingsModel({
    required super.language,
    required super.themeMode,
    required super.radioVolume,
  });
  factory DeviceSettingsModel.fromJson(Map<String, dynamic> json) {
    return DeviceSettingsModel(
      language: json['language'] as String,
      themeMode: json['themeMode'] as int,
      radioVolume: json['radioVolume'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'language': language,
      'themeMode': themeMode,
      "radioVolume": radioVolume,
    };
  }
}
