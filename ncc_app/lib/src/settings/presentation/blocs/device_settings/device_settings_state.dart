part of 'device_settings_bloc.dart';

sealed class DeviceSettingsState extends Equatable {
  const DeviceSettingsState();
}

final class DeviceSettingsInitialState extends DeviceSettingsState {
  @override
  List<Object?> get props => [];
}

//loading state
final class DeviceSettingsLoadingState extends DeviceSettingsState {
  @override
  List<Object?> get props => [];
}

//error state
final class DeviceSettingsErrorState extends DeviceSettingsState {
  final String message;
  final int code;
  final Function()? onRetry;

  const DeviceSettingsErrorState({
    required this.message,
    required this.code,
    required this.onRetry,
  });

  @override
  List<Object?> get props => [message, code, onRetry];
}

//loaded state
/// loaded status
enum DeviceSettingsLoadedStatus { initial, inProgress, success, error }

final class DeviceSettingsLoadedState extends DeviceSettingsState {
  final DeviceSettingsLoadedStatus status;
  final String? message;
  final String? shortMessage;
  final DeviceSettings deviceSettings;

  const DeviceSettingsLoadedState({
    this.status = DeviceSettingsLoadedStatus.initial,
    this.message,
    this.shortMessage,
    required this.deviceSettings,
  });

  @override
  List<Object?> get props => [status, message, shortMessage, deviceSettings];

  DeviceSettingsLoadedState copyWith({
    DeviceSettingsLoadedStatus? status,
    String? message,
    String? shortMessage,
    DeviceSettings? deviceSettings,
  }) {
    return DeviceSettingsLoadedState(
      status: status ?? DeviceSettingsLoadedStatus.initial,
      message: message ?? this.message,
      shortMessage: shortMessage ?? this.shortMessage,
      deviceSettings: deviceSettings ?? this.deviceSettings,
    );
  }
}
