import 'package:encrypt_shared_preferences/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:volume_controller/volume_controller.dart';

import 'core/app/app.dart';
import 'core/injection/init_di.dart';
import 'core/route/routes_config.dart';
import 'core/utils/configure_non_web.dart'
    if (dart.library.html) 'core/utils/configure_web.dart';
import 'core/utils/constants.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await EncryptedSharedPreferences.initialize('9UwbWAJo8elUBZFg');
  VolumeController.instance.showSystemUI = false;

  configureApp();
  await JustAudioBackground.init(
    androidNotificationChannelId: '9UwbWAJekjfwurt09twe4ufjew4po8elUBZFg',
    androidShowNotificationBadge: true,
    notificationColor: kNCCSecondaryColor,
    androidNotificationChannelName: 'البث الإذاعي',
    androidNotificationChannelDescription:
        'قناة إشعارات لتشغيل البث الإذاعي في الخلفية والتحكم في التشغيل.',
    androidNotificationOngoing: true,
    androidNotificationIcon: 'drawable/ic_radio_notification',
  );

  await initDi();
  await sl<RoutesService>().init();

  runApp(const App());
}
