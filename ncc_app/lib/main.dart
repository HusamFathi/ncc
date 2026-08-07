import 'package:encrypt_shared_preferences/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'core/app/app.dart';
import 'core/injection/init_di.dart';
import 'core/route/routes_config.dart';
import 'core/utils/configure_non_web.dart'
    if (dart.library.html) 'core/utils/configure_web.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await EncryptedSharedPreferences.initialize('9UwbWAJo8elUBZFg');

  // This will call the correct version of configureApp
  // based on the platform (web or non-web)
  configureApp();

  await initDi();
  await sl<RoutesService>().init();

  runApp(const App());
}
