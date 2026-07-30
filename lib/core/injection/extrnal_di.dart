import 'package:shared_preferences/shared_preferences.dart';

import 'init_di.dart';

Future<void> externalDi() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  // Use sharedPreferences as needed
  // Inject sharedPreferences to be used elsewhere
  sl.registerSingleton<SharedPreferences>(sharedPreferences);
}
