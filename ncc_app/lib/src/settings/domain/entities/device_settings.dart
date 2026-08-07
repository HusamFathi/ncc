import 'package:equatable/equatable.dart';

import '../../../../core/injection/init_di.dart';
import '../../../../core/locale/app_language.dart';

class DeviceSettings extends Equatable {
  final String language;
  final int themeMode;

  const DeviceSettings({required this.language, required this.themeMode});

  @override
  List<Object?> get props => [language, themeMode];
  factory DeviceSettings.empty() {
    return DeviceSettings(
      language: sl<AppLanguage>().getCurrentLanguage().localCode,
      themeMode: 0,
    );
  }
  DeviceSettings copyWith({String? language, int? themeMode}) {
    return DeviceSettings(
      language: language ?? this.language,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  bool get isDark => themeMode == 1;
}
