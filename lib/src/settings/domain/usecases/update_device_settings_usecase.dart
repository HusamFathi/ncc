import 'package:fpdart/fpdart.dart';

import '../../../../core/extensions/string.dart';
import '../../../../core/failures/failures.dart';
import '../../../../core/locale/app_localizations_helper.dart';
import '../entities/device_settings.dart';
import '../repositories/device_settings_repository.dart';

class UpdateDeviceSettingsUseCase {
  final DeviceSettingsRepository _repository;

  UpdateDeviceSettingsUseCase({required DeviceSettingsRepository repository})
    : _repository = repository;

  Future<Either<Failure, DeviceSettings>> call({
    required DeviceSettings settings,
  }) async {
    try {
      return Right(await _repository.updateDeviceSettings(settings: settings));
    } catch (e) {
      return Left(
        UnableToLoadInitalSettingsFailure(
          message: Tr.current.unableToLoadLocalData.capitalizeFirstLetter(),
        ),
      );
    }
  }
}
