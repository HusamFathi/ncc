import 'package:get_it/get_it.dart';
import 'package:ncc/core/injection/entity_injections/intro_data_di.dart';

import '../../src/home/di/home_di.dart';
import '../../src/settings/di/settings_di.dart';
import 'extrnal_di.dart';
import 'main_di.dart';
import 'radio_di.dart';
import 'services_di.dart';

GetIt sl = GetIt.instance;
Future<void> initDi() async {
  servicesDi();

  await externalDi();
  settingsDi();
  homeDi();
  radioDi();
  mainDi();
  introDataDI();
}
