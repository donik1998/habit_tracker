import 'package:get_it/get_it.dart';
import 'package:habit_tracker/data/local/preferences.dart';
import 'package:injectable/injectable.dart';

import 'dependency_injection.config.dart';

final locator = GetIt.I;

@injectableInit
Future<void> setupLocator([String? environment]) async {
  locator.init(environment: environment);
  await initLazySingletons();
}

Future<void> initLazySingletons() async {
  await locator.allReady();
  await locator<LocalPreferences>().init();
}
