import '../../../../core/utils/mapper.dart';
import '../../domain/entities/device_settings.dart';
import '../models/device_settings_model.dart';

class DeviceSettingsMapper
    extends DataMapper<DeviceSettings, DeviceSettingsModel> {
  @override
  DeviceSettings mapToEntity({required DeviceSettingsModel model}) {
    return DeviceSettings(language: model.language, themeMode: model.themeMode);
  }

  @override
  DeviceSettingsModel mapToModel({required DeviceSettings entity}) {
    return DeviceSettingsModel(
      language: entity.language,
      themeMode: entity.themeMode,
    );
  }
}
