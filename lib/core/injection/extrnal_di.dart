import 'package:encrypt_shared_preferences/provider.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../network/network_info.dart';
import 'init_di.dart';

Future<void> externalDi() async {
  final EncryptedSharedPreferences sharedPreferences =
      EncryptedSharedPreferences.getInstance();
  // Use sharedPreferences as needed
  // Inject sharedPreferences to be used elsewhere
  sl.registerSingleton<EncryptedSharedPreferences>(sharedPreferences);
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

    sl.registerLazySingleton(() => InternetConnection());

}
