import 'package:get_it/get_it.dart';
import 'package:mes_lite/core/theme/theme_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Injection {
  static final getIt = GetIt.instance;

  static Future<void> setup() async {
    final prefs = await SharedPreferences.getInstance();
    getIt.registerLazySingleton<SharedPreferences>(() => prefs);

    getIt.registerFactory(() => ThemeCubit(prefs));
  }
}
