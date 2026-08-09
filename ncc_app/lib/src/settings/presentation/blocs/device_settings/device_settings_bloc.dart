import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../core/failures/failures.dart';
import '../../../../../core/src/entities/no_params.dart';
import '../../../domain/entities/device_settings.dart';
import '../../../domain/usecases/get_device_settings_usecase.dart';
import '../../../domain/usecases/update_device_settings_usecase.dart';

part 'device_settings_event.dart';
part 'device_settings_state.dart';

class DeviceSettingsBloc
    extends Bloc<DeviceSettingsEvent, DeviceSettingsState> {
  final UpdateDeviceSettingsUseCase updateDeviceSettingsUseCase;
  final GetDeviceSettingsUseCase getDeviceSettingsUseCase;
  DeviceSettingsBloc({
    required this.updateDeviceSettingsUseCase,
    required this.getDeviceSettingsUseCase,
  }) : super(DeviceSettingsInitialState()) {
    on<DeviceSettingsStarted>((event, emit) async {
      log('DeviceSettingsStarted $event');

      emit(DeviceSettingsLoadingState());
      final Either<Failure, DeviceSettings> resultrOrError =
          await getDeviceSettingsUseCase(params: NoParams());
      resultrOrError.fold(
        (error) {
          emit(
            DeviceSettingsLoadedState(deviceSettings: DeviceSettings.empty()),
          );
        },
        (deviceSettings) {
          emit(DeviceSettingsLoadedState(deviceSettings: deviceSettings));
        },
      );
    });
    on<DeviceSettingsUpdated>((event, emit) async {
      final Either<Failure, DeviceSettings> resultrOrError =
          await updateDeviceSettingsUseCase(settings: event.updatedSettings);
      resultrOrError.fold(
        (error) => emit(
          DeviceSettingsLoadedState(deviceSettings: DeviceSettings.empty()),
        ),
        (deviceSettings) {
          log('DeviceSettingsBloc: DeviceSettingsUpdated: $deviceSettings');
          emit(DeviceSettingsLoadedState(deviceSettings: deviceSettings));
        },
      );
    });
  }
}
