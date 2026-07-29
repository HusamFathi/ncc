part of 'device_settings_bloc.dart';

sealed class DeviceSettingsEvent extends Equatable {
  const DeviceSettingsEvent();
}

// load config
final class DeviceSettingsStarted extends DeviceSettingsEvent {
  const DeviceSettingsStarted();

  @override
  List<Object?> get props => [];
}

// update settings
final class DeviceSettingsUpdated extends DeviceSettingsEvent {
  final DeviceSettings updatedSettings;

  const DeviceSettingsUpdated({required this.updatedSettings});

  @override
  List<Object?> get props => [updatedSettings];
}
