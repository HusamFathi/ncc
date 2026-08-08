import 'package:equatable/equatable.dart';

import '../../../../core/injection/init_di.dart';
import '../../../../core/locale/app_language.dart';

class DeviceSettings extends Equatable {
  final String language;
  final int themeMode;
  final double radioVolume;

  const DeviceSettings({
    required this.language,
    required this.themeMode,
    required this.radioVolume,
  });

  @override
  List<Object?> get props => [language, themeMode, radioVolume];
  factory DeviceSettings.empty() {
    return DeviceSettings(
      language: sl<AppLanguage>().getCurrentLanguage().localCode,
      themeMode: 0,
      radioVolume:1
    );
  }
  DeviceSettings copyWith({String? language, int? themeMode,
  double? radioVolume
  
  
  }) {
    return DeviceSettings(
      language: language ?? this.language,
      themeMode: themeMode ?? this.themeMode,
      radioVolume: radioVolume ?? this.radioVolume,
    );
  }

  bool get isDark => themeMode == 1;
}
