import 'package:encrypt_shared_preferences/provider.dart';

import 'init_di.dart';

Future<void> externalDi() async {
  final EncryptedSharedPreferences sharedPreferences =
      EncryptedSharedPreferences.getInstance();
  // Use sharedPreferences as needed
  // Inject sharedPreferences to be used elsewhere
  sl.registerSingleton<EncryptedSharedPreferences>(sharedPreferences);
}
