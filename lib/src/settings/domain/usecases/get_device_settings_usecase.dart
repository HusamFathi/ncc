import '../../../../core/src/entities/no_params.dart';
import '../../../../core/src/usecases/base_usecase.dart';
import '../entities/device_settings.dart';
import '../repositories/device_settings_repository.dart';

class GetDeviceSettingsUseCase extends BaseUseCase<DeviceSettings, NoParams> {
  final DeviceSettingsRepository _repository;

  GetDeviceSettingsUseCase({required DeviceSettingsRepository repository})
    : _repository = repository;

  @override
  Future<DeviceSettings> execute(NoParams params) {
    return _repository.getDeviceSettings();
  }
}
