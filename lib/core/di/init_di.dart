import 'package:get_it/get_it.dart';
import 'package:ncc/core/di/main_di.dart';

import '../../core/di/extrnal_di.dart';
import '../../core/di/services_di.dart';
import '../../src/home/di/home_di.dart';
import '../../src/settings/di/settings_di.dart';
import 'radio_di.dart';

GetIt sl = GetIt.instance;
Future<void> initDi() async {
  servicesDi();

  await externalDi();
  settingsDi();
  homeDi();
  radioDi();
  mainDi();
}
