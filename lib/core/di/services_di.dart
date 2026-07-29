import '../locale/app_language.dart';
import '../route/routes_config.dart';
import '../theme/app_theme.dart';
import 'init_di.dart' show sl;

void servicesDi() async {
  //* core dependencies
  // sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  sl.registerLazySingleton<AppLanguage>(() => AppLanguage());
  sl.registerLazySingleton<AppTheme>(() => AppTheme());
  sl.registerLazySingleton<RoutesService>(() => RoutesService());

  // final talker = TalkerFlutter.init(settings: TalkerSettings());

  // sl.registerSingleton<Talker>(talker);

  // Bloc.observer = TalkerBlocObserver(
  //   talker: talker,
  //   settings: const TalkerBlocLoggerSettings(
  //     printCreations: false,
  //     printClosings: false,
  //     printStateFullData: false,
  //   ),
  // );
}
