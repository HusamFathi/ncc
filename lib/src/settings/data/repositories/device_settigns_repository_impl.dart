import '../../../../core/injection/init_di.dart';
import '../../domain/entities/device_settings.dart';
import '../../domain/repositories/device_settings_repository.dart';
import '../datasources/local/device_settings_local_data_source.dart';
import '../mappers/device_settings_mapper.dart';

class DeviceSettingsRepositoryImpl implements DeviceSettingsRepository {
  final DeviceSettingsLocalDataSourceImpl _localDataSource;
  DeviceSettingsRepositoryImpl({
    required DeviceSettingsLocalDataSourceImpl localDataSource,
  }) : _localDataSource = localDataSource;

  @override
  Future<DeviceSettings> getDeviceSettings() {
    return _localDataSource.getDeviceSettings();
  }

  @override
  Future<void> resetDeviceSettings() {
    // TODO: implement resetDeviceSettings
    throw UnimplementedError();
  }

  @override
  Future<DeviceSettings> updateDeviceSettings({
    required DeviceSettings settings,
  }) {
    return _localDataSource.updateDeviceSettings(
      settings: sl<DeviceSettingsMapper>().mapToModel(entity: settings),
    );
  }
}
