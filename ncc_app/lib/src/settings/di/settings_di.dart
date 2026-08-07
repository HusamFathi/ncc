import '../../../core/injection/init_di.dart';
import '../data/datasources/local/device_settings_local_data_source.dart';
import '../data/mappers/device_settings_mapper.dart';
import '../data/repositories/device_settigns_repository_impl.dart';
import '../domain/repositories/device_settings_repository.dart';
import '../domain/usecases/get_device_settings_usecase.dart';
import '../domain/usecases/update_device_settings_usecase.dart';
import '../presentation/blocs/device_settings/device_settings_bloc.dart';

void settingsDi() {
  sl.registerLazySingleton<GetDeviceSettingsUseCase>(
    () => GetDeviceSettingsUseCase(repository: sl()),
  );
  sl.registerLazySingleton<UpdateDeviceSettingsUseCase>(
    () => UpdateDeviceSettingsUseCase(repository: sl()),
  );
  sl.registerFactory<DeviceSettingsBloc>(
    () => DeviceSettingsBloc(
      getDeviceSettingsUseCase: sl(),
      updateDeviceSettingsUseCase: sl(),
    ),
  );
  sl.registerLazySingleton<DeviceSettingsLocalDataSourceImpl>(
    () => DeviceSettingsLocalDataSourceImpl(sharedPreferences: sl()),
  );
  sl.registerLazySingleton<DeviceSettingsRepository>(
    () => DeviceSettingsRepositoryImpl(localDataSource: sl()),
  );
  sl.registerLazySingleton<DeviceSettingsMapper>(() => DeviceSettingsMapper());
}
